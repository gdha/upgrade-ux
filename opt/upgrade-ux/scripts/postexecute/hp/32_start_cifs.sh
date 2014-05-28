# 32_start_cifs.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start CIFS"
    [[ -x /sbin/init.d/samba ]] && /sbin/init.d/samba start >&2
fi
