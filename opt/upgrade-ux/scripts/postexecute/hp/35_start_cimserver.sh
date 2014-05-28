# 35_start_cimserver.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start cimserver"
    [[ -x /opt/wbem/sbin/cimserver ]] && /opt/wbem/sbin/cimserver  >&2
fi
