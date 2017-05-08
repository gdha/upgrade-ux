# 17_list_nbu_backup_status.sh

[[ ! -x /usr/openv/netbackup/bin/bpclimagelist ]] && return   # no NBU sw installed - return

LANG=C /usr/openv/netbackup/bin/bpclimagelist  > "$VAR_DIR/$DS/netbackup_backup_list.output"

if [[ ! -s "$VAR_DIR/$DS/netbackup_backup_list.output" ]] ; then
    # If the file "$VAR_DIR/$DS/netbackup_backup_list.output" has size 0 then the client is
    # not properly defined in the NBU master and no backups were found - this is not OK!
    LogPrint "Warning: No Symantec NetBackup backups were found!"

else

    # backups were found ; show the date of the last full backup
    LASTFULL=$(LANG=C /usr/openv/netbackup/bin/bpclimagelist | grep Full | head -1 | cut -c1-10)
    LASTFULLSEC=$(date +%s -d $LASTFULL)
    NOWSEC=$(date +%s)

    DIFFDAYS=$(( ($NOWSEC - $LASTFULLSEC) /86400 ))

    if (( $DIFFDAYS > 14 )); then
        LogPrint "WARNING - Last full backup is $DIFFDAYS days old"
    else
        Log "Last full backup is $DIFFDAYS days old [OK]"
    fi

fi
