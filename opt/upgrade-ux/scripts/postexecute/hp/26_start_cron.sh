# 26_start_cron.sh
if (( PREVIEW )) ;then
    : # not required in preview mode (as these processes are not stopped)
else
    LogPrint "Starting cron scheduler"
    [[ -x  /sbin/init.d/cron ]] && /sbin/init.d/cron start >&2
fi

