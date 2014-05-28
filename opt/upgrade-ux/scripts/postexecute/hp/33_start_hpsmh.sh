# 33_start_hpsmh.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start HP System Mgmt Homepage"
    [[ -x /sbin/init.d/hpsmh ]] && /sbin/init.d/hpsmh start >&2
fi
