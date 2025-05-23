# preinstall/GNU/Linux/36_stop_rapid7.sh
# Stop ir_agent agent

service ir_agent status >&2 || return

if (( PREVIEW )) ; then
    Log "Stopping ir_agent (rapid7) agent  [not done in preview]"
else
    LogPrint "Stopping ir_agent (rapid7) agent"
    service ir_agent stop >&2
fi
