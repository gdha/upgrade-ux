# postexecute/GNU/Linux/20_start_ds_agent.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start Trend Micro Deep Security anti-virus services"
    service ds_agent status || service ds_agent start >&2
fi
