# 13_shutdown_lp.sh
if (( PREVIEW )) ; then
    Log "Stopping lp scheduler [not done in preview]"
else
    LogPrint "Stopping lp scheduler"
    [[ -x /sbin/init.d/lp ]] && /sbin/init.d/lp stop >&2
fi

