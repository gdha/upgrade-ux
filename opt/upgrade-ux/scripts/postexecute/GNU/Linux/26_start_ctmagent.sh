# postexecute/GNU/Linux/25_start_ctmagent.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start Control M daemon"
    service ctmagent status || service ctmagent start >&2
fi
