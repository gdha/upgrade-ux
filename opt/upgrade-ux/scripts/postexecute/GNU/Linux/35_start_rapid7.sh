# postexecute/GNU/Linux/35_start_rapid7.sh
# Start ir_agent rapid7
if (( PREVIEW )) ; then
    :
else
    [[ -x /opt/rapid7/ir_agent/ir_agent ]] || return  # no rapid7 present - just return
    LogPrint "Start the ir_agent (rapid7) service"
    service ir_agent status || service ir_agent start >&2
fi
