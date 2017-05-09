# 10_stop_ds_agent.sh
# Stop The Trend Micro Deep Security sub-system before patching

[[ ! -f /etc/rc.d/init.d/ds_agent ]] && return  # not present

if (( PREVIEW )) ; then
    Log "Stopping Trend Micro Deep Security services [not done in preview]"
else
    LogPrint "Stopping Trend Micro Deep Security services"
    [[ -x /etc/rc.d/init.d/ds_agent ]] && /etc/rc.d/init.d/ds_agent stop >&2
fi

