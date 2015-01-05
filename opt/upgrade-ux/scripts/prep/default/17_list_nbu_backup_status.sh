# 17_list_nbu_backup_status.sh

[[ ! -x /usr/openv/netbackup/bin/bpclimagelist ]] && return   # no NBU sw installed - return

LANG=C /usr/openv/netbackup/bin/bpclimagelist  > "$VAR_DIR/$DS/netbackup_backup_list.output"

LASTFULL=$(LANG=C /usr/openv/netbackup/bin/bpclimagelist | grep Full | head -1 | cut -c1-10)
LASTFULLSEC=$(date +%s -d $LASTFULL)
NOWSEC=$(date +%s)

DIFFDAYS=$(( ($NOWSEC - $LASTFULLSEC) /86400 ))

if (( $DIFFDAYS > 14 )); then
    LogPrint "WARNING - Last full backup is $DIFFDAYS days old"
else
    Log "Last full backup is $DIFFDAYS days old [OK]"
fi

