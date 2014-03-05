# ------------------------------------------------------------------------------
# Paramters --------------------------------------------------------------------
# ------------------------------------------------------------------------------

typeset -x PID=$$
typeset -r platform=$(uname -s)         # Operating System name, e.g. Linux, HP-UX, SunOS
typeset -r lhost=$(uname -n)            # Local host name
typeset    osVer=$(uname -r)            # OS Release
osVer=$(echo ${osVer#B.})               # B.11.11 becomes 11.11
typeset -r model=$(uname -m)            # Model of the system (architecture)

# we gonna remove the .sh extention from the following filenames
typeset ERRfile=$LOG_DIR/${PROGRAM%.*}-${PID}-ERRfile.txt  # contains the exit code (not sure we keep this??)
typeset LOGFILE=$LOG_DIR/${PROGRAM%.*}-${PID}-LOGFILE.log
typeset LOCKDIR=/tmp/${PROGRAM%.*}-LOCKDIR
typeset PIDFILE=${LOCKDIR}/${PROGRAM%.*}-PIDFILE

# ------------------------------------------------------------------------------
# Functions --------------------------------------------------------------------
# ------------------------------------------------------------------------------

function IsDigit {
    expr "$1" + 1 > /dev/null 2>&1  # sets the exit to non-zero if $1 non-numeric
}

# ------------------------------------------------------------------------------
function LogToSyslog {
    # send a line to syslog or messages file with input string
    logger -t $PROGRAM -i "$*"
}

# ------------------------------------------------------------------------------
function MailTo {
    [ -s "$LOGFILE" ] || LOGFILE=/dev/null
    if [[ -n $mailusr ]]; then
        mailx -s "$*" $mailusr < $LOGFILE
    fi
}

# ------------------------------------------------------------------------------
function Revision {
    typeset rev
    rev=$(awk '/Revision/ { print $3 }' $PRGDIR/$PROGRAM | head -1)
    [ -n "$rev" ] || rev="\"Under Development\""
    printf "%s %s\n" $PROGRAM $rev
} # Acquire revision number of the script and plug it into the log file

# ------------------------------------------------------------------------------
function WhoAmI {
    if [ "$(id -u)" != "0" ]; then
        echo "$LOGNAME - You must be root to run script $PROGRAM" 
        echo 1 > $ERRfile
        exit 1
    fi
}

# ------------------------------------------------------------------------------
function is_var_empty {
    if [ -z "$1" ]; then
    Usage
        echo 1 > $ERRfile
    exit 1
    fi
}

# ------------------------------------------------------------------------------
function CreateLockDir {
    mkdir "${LOCKDIR}" >/dev/null 2>/dev/null
    if [[ $? -eq 0 ]]; then
        # create the PIDFILE now
        if echo $PID > $PIDFILE ; then
            Log "lock succeeded: $PID - $PIDFILE"
        else
            Log "Cannot create $PIDFILE (rc=$?)"
            return 1
        fi
    else # else part of mkdir test
        # LOCKDIR already exists
        if [ -f $PIDFILE ]; then
            Log "Found $PIDFILE file - we could be locked..."
            OTHERPID=$(<$PIDFILE)
            if kill -s 0 ${OTHERPID} 2>/dev/null ; then
                Log "locked on ${OTHERPID} - try again"
            return 1
            else
                Log "lock is stale (${OTHERPID}) - will continue"
            fi
        fi
        if echo $PID > $PIDFILE ; then
            Log "lock succeeded: $PID - $PIDFILE"
        else
            Log "lock failed: $LOCK with rc=$?"
            Log "stop processing"
            return 1
        fi
    fi  # end of mkdir test

    ## check if PIDFILE contains our PID
    CHECKPID=$(<$PIDFILE)
    [[ ${PID} != ${CHECKPID} ]] && return 1   # not successful; try again

    # our PID is effectivily written in the PIFDILE
    return 0
}

# ------------------------------------------------------------------------------
function AcquireLock {
    Log "Check if our PID ($PID) is locked"
    CANWEPROCEED=0
    LOCKTAKESTOOLONG=0
    while ( test $CANWEPROCEED -eq 0 )
    do
        LOCKTAKESTOOLONG=$(( LOCKTAKESTOOLONG + 1 ))
        if [[ $LOCKTAKESTOOLONG -gt 1000 ]]; then
            Error "Waiting on the lock to release takes too long (> $LOCKTAKESTOOLONG seconds)"
        fi
        CreateLockDir && CANWEPROCEED=1
        sleep 1
    done
    return 0
}

# ------------------------------------------------------------------------------
function ReleaseLock {
    # remove the lock only if PID is current one
    CHECKPID=$(<$PIDFILE)
    if [[ ${PID} = ${CHECKPID} ]]; then
        # ok we are sure if is our lock
        rm -rf "${LOCKDIR}"
        if [[ $? -eq 0 ]]; then
            Log "Successfully removed the lock directory (${LOCKDIR})"
        else
            Log "We could not remove the lock directory (${LOCKDIR}) due to rm error $?"
        fi
    else
        Log "The lock contains another PID ($CHECKPID) then our effective PID ($PID)"
        Log "We do not remove the lock directory ${LOCKDIR}"
    fi
    return 0
}

# ------------------------------------------------------------------------------
function IsDigit {
    expr "$1" + 1 > /dev/null 2>&1  # sets the exit to non-zero if $1 non-numeric
}

# ------------------------------------------------------------------------------
function GetHostnameFromIP {
    # input is IP address; output hostname
    case ${platform} in
        HP-UX)
             xxx=$(nslookup $1 | grep "^Name:" | awk '{print $2}' 2>/dev/null)
         ;;
        Linux)
             xxx=$(dig +short -x $1 | cut -d. -f1 2>/dev/null)
         ;;
    esac
    [[ -z "$xxx" ]] && xxx="UNKNOWN"
    echo $xxx
}

# ------------------------------------------------------------------------------

function IsVolumeGroupActive {
    # input arg: VG; output:0=VG active, or 1=VG not active)
    typeset VG=$1
    TMPVG=/tmp/vgdisplay-${VG}.${PID}
    vgdisplay ${VG} > ${TMPVG} 2>&1
    grep -q "Cannot display volume group" ${TMPVG}
    if [[ $? -eq 0 ]]; then
        Log "VG $VG is \"not\" active."
        rc=1
    else
        Log "VG $VG is active."
    rc=0
    fi
    grep -q "is exported" ${TMPVG}
    if [[ $? -eq 0 ]]; then
        Log "VG $VG is \"exported\"."
        rc=1
    fi
    rm -f ${TMPVG}
    return $rc
}

# ------------------------------------------------------------------------------
function Timeout {
    # function to timeout processes hanging on e.g. stale NFS mount points
    # usage: timeout seconds commands
    # Timeout 10 ls $mount_point >/dev/null
    # rc=$?
    # [[ $rc -ne 0 ]] && echo "stale $mount_point" || echo "mount point $mount_point seems not to be stale"

    # argument 1: integer in seconds
    [ "$DEBUG" ] && set -x
    TIMEOUT=$1
    IsDigit $TIMEOUT || Error "Timeout value must be an integer [seconds]"
    shift
    COMMAND="$@"
    RET=0
    # Launch command in backgroup
    #[ ! "$DEBUG" ] && exec 6>&2 # Link file descriptor #6 with stderr.
    #[ ! "$DEBUG" ] && exec 2> /dev/null # Send stderr to null (avoid the Terminated messages)
    ##$COMMAND 2>&1 >/dev/null &
    $COMMAND  &
    COMMAND_PID=$!
    [ "$DEBUG" ] && LogPrint "Background command pid $COMMAND_PID, parent pid $$"
    # Timer that will kill the command if timesout
    sleep $TIMEOUT && UNIX95= ps -p $COMMAND_PID -o pid,ppid |grep $$ | awk '{print $1}' | xargs kill &
    KILLER_PID=$!
    [ "$DEBUG" ] && LogPrint "Killer command pid $KILLER_PID, parent pid $$"
    wait $COMMAND_PID
    RET=$?
    # Kill the killer timer
    [ "$DEBUG" ] && UNIX95= ps -e -o pid,ppid |grep $KILLER_PID | awk '{print $1}' | xargs LogPrint "Killing processes: "
    UNIX95= ps -e -o pid,ppid |grep -v PID | grep $KILLER_PID | awk '{print $1}' | xargs kill
    wait
    sleep 1
    #[ ! "$DEBUG" ] && exec 2>&6 6>&- # Restore stderr and close file descriptor #6.
    return $RET
}

# ------------------------------------------------------------------------------
function Cleanup {
    rm -f $ERRfile
    return 0
}

