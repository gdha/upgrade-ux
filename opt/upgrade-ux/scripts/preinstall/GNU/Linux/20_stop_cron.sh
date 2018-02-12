# 20_stop_cron.sh 
if (( PREVIEW )) ; then
    Log "Stopping cron daemon [not done in preview]"
else
    LogPrint "Stopping cron daemon"
    service crond stop >&2
fi

