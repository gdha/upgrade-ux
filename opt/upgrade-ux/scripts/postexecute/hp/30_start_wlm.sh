# 30_start_wlm.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start WLM"
    [[ -x /sbin/init.d/wlm ]] && /sbin/init.d/wlm start >&2
fi
