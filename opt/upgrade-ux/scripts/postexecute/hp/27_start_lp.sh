# 27_start_lp.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start lp scheduler"
    [[ -x /sbin/init.d/lp ]] && /sbin/init.d/lp start >&2
fi
