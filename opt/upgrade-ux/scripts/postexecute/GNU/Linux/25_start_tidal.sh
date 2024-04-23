# postexecute/GNU/Linux/25_start_tidal.sh
if (( PREVIEW )) ; then
    :
else
    [[ -f /etc/systemd/system/tagent.service ]] || return  # no Tidal systemd script present; just return
    LogPrint "Start tidal daemon"
    service tagent status || service tagent start >&2
fi
