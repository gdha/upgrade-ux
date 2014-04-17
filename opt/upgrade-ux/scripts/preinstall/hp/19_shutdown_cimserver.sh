# 19_shutdown_cimserver.sh
if (( PREVIEW )) ; then
    Log "Stopping cimserver process [not done in preview]"
else
    LogPrint "Stopping cimserver process"
    [[ -x /opt/wbem/sbin/cimserver ]] && /opt/wbem/sbin/cimserver -s >&2
fi

