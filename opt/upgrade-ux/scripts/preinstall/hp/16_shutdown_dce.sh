# 16_shutdown_dce.sh
if (( PREVIEW )) ; then
    Log "Stopping DCE processes [not done in preview]"
else
    LogPrint "Stopping DCE processes"
    [[ -x /sbin/init.d/dce ]] && /sbin/init.d/dce stop >&2
fi

