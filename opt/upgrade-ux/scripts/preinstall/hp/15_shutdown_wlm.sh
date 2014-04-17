# 15_shutdown_wlm.sh
if (( PREVIEW )) ; then
    Log "Stopping WLM processes [not done in preview]"
else
    LogPrint "Stopping WLM processes"
    [[ -x /sbin/init.d/wlm ]] && /sbin/init.d/wlm stop >&2
fi

