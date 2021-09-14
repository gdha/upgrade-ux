# postexecute/GNU/Linux/30_start_fluentbit.sh
# Start the Fluentbit agent
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start Fluentbit agent"
    service td-agent-bit status || service td-agent-bit start >&2
fi
