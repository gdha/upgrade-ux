# prep/default/17_list_nbu_backup_status.sh

[[ ! -x /usr/openv/netbackup/bin/bpclimagelist ]] && return   # no NBU sw installed - return

BPARG=""
# Issue #138 - to avoid long timeouts of approx 10 minutes work with a timeout of 10s
timeout 10s /usr/openv/netbackup/bin/bpclimagelist $BPARG  > "$VAR_DIR/$DS/netbackup_backup_list.output"

if [[ ! -s "$VAR_DIR/$DS/netbackup_backup_list.output" ]] ; then
    # If the file "$VAR_DIR/$DS/netbackup_backup_list.output" has size 0 then it could
    # be that this client is using snapshots (for VM). We will try if with -client option
    BPARG="-client $HOSTNAME"
    timeout 10s /usr/openv/netbackup/bin/bpclimagelist $BPARG > "$VAR_DIR/$DS/netbackup_backup_list.output"
fi

if [[ ! -s "$VAR_DIR/$DS/netbackup_backup_list.output" ]] ; then
    # If the file "$VAR_DIR/$DS/netbackup_backup_list.output" has size 0 then this client
    # is not properly defined in the NBU master and no backups were found - this is not OK!
    LogPrint "Warning: No Symantec NetBackup backups were found!"

else

    # backups were found ; show the date of the last full backup
    LASTFULL=$(LANG=C /usr/openv/netbackup/bin/bpclimagelist $BPARG | grep Full | head -1 | cut -c1-10)
    LASTFULLSEC=$(date +%s -d $LASTFULL)
    NOWSEC=$(date +%s)

    DIFFDAYS=$(( (NOWSEC - LASTFULLSEC) /86400 ))

    if (( DIFFDAYS > 14 )); then
        LogPrint "WARNING - Last full backup is $DIFFDAYS days old"
    else
        Log "Last full backup is $DIFFDAYS days old [OK]"
    fi

fi
