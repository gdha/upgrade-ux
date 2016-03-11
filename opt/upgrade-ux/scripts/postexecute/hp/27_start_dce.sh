# 27_start_dce.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start DCE"
    [[ -x /sbin/init.d/dce ]] && /sbin/init.d/dce start >&2
fi
