# postexecute/GNU/Linux/20_start_ds_agent.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start Trend Micro Deep Security anti-virus services"
    # [[ -x /etc/rc.d/init.d/ds_agent ]] && /etc/rc.d/init.d/ds_agent start >&2
    service ds_agent start >&2
fi
