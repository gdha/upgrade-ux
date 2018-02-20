# 20_stop_tidal.sh 
if (( PREVIEW )) ; then
    Log "Stopping tidal daemon [not done in preview]"
else
    LogPrint "Stopping tidal daemon"
    service tagent status && service tagent stop >&2
fi

