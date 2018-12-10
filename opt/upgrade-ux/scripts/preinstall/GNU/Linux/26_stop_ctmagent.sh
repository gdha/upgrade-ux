# 25_stop_ctmagent.sh 
if (( PREVIEW )) ; then
    Log "Stopping Control M daemon [not done in preview]"
else
    LogPrint "Stopping Control M daemon"
    service ctmagent status && service ctmagent stop >&2
fi

