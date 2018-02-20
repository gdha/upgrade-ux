# postexecute/GNU/Linux/25_start_tidal.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start tidal daemon"
    service tagent status || service tagent start >&2
fi
