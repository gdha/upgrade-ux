# 23_shutdown_cron.sh
if (( PREVIEW )) ; then
    Log "Stopping cron scheduler [not done in preview]"
else
    LogPrint "Stopping lp scheduler"
    [[ -x  /sbin/init.d/cron ]] && /sbin/init.d/cron stop >&2
fi

