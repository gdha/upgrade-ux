# 38_restart_gated.sh
# if we would install gated related patches we must stop/start after the patch installation otherwise we could loose network
# connectivity
if (( PREVIEW )) ;then
    : # not required in preview mode (as these processes are not stopped)
else
    LogPrint "Restarting the gated daemon"
    [[ -x  /sbin/init.d/gated ]] && /sbin/init.d/cron stop >&2
    [[ -x  /sbin/init.d/gated ]] && /sbin/init.d/cron start >&2
fi

