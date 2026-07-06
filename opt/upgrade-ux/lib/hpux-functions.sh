function ShowErrorsSwagentLog {
    # /var/adm/sw/swagent.log contains verify output
    [[ ! -f /var/adm/sw/swagent.log ]] && return  # no file; return
    # grab the latest jobid nr
    jobid=$( FindJobId /var/adm/sw/swagent.log )
    # with the jobid we can trim the swagent.log file to the latest run
    awk '/'$jobid'/ {flag=1;next}  /'$jobid'/ {flag=0} flag {print}' /var/adm/sw/swagent.log > $TMP_DIR/swagent.$jobid
    grep -i error: $TMP_DIR/swagent.$jobid
}
# ------------------------------------------------------------------------------

function FindJobId {
    # return the jobid nr from log file ($1); output is string containing jobid or empty
    if [[ ! -f "$1" ]]; then
        echo ""
    else
	tail -5 "$1" | grep jobid | cut -d= -f2 | sed -e 's/)//'
    fi
}
# ------------------------------------------------------------------------------

function SwJob {
    # input argument is SWINSTALL or SWREMOVE variable; according cmd we will select
    # the proper log file to investigate with swjob
    [[ -z "$1" ]] && return   # no argument - no output
    # $1=/usr/sbin/swinstall => /var/adm/sw/swinstall.log
    swlogfile=/var/adm/sw/${1##*/}.log
    # Extract only the numeric job ID from the log to avoid executing arbitrary
    # content from the log file (security fix: no more "echo ... | sh -").
    # swjob lines look like: "  swjob -a log -j <jobID> @<host>:/  command ..."
    swjob_id="$( tail -10 "$swlogfile" | grep swjob | grep -oE '\-j [0-9]+' | awk '{print $2}' | tail -1 )"
    if [[ -z "$swjob_id" ]]; then
        Log "SwJob: could not find a numeric job ID in $swlogfile"
        return 1
    fi
    # Validate: job ID must be purely numeric
    if [[ ! "$swjob_id" =~ ^[0-9]+$ ]]; then
        Log "SwJob: unexpected non-numeric job ID '$swjob_id' - skipping"
        return 1
    fi
    Log "Running: swjob -a log -j $swjob_id"
    swjob -a log -j "$swjob_id"
}
