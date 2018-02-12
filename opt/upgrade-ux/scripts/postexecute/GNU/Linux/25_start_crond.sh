# postexecute/GNU/Linux/25_start_crond.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start cron daemon"
    service crond status || service crond start >&2
fi
