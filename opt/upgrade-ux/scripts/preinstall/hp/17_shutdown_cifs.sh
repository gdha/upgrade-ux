# 17_shutdown_cifs.sh
if (( PREVIEW )) ; then
    Log "Stopping CIFS processes [not done in preview]"
else
    LogPrint "Stopping CIFS processes"
    [[ -x /sbin/init.d/samba ]] && /sbin/init.d/samba stop >&2
fi

