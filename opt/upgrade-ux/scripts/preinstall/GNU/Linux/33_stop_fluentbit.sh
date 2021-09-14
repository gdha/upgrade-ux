# preinstall/GNU/Linux/33_stop_fluentbit.sh
# Stop fluentbit agent to avoid incident logging during patching due to
# certailn daemons that are stopped on purpose

service td-agent-bit status >&2 || return

if (( PREVIEW )) ; then
    Log "Stopping Fluentbit agent  [not done in preview]"
else
    LogPrint "Stopping Fluentbit agent"
    service td-agent-bit stop >&2
fi
