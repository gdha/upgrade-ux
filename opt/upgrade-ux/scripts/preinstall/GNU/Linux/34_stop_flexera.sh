# preinstall/GNU/Linux/34_stop_flexera.sh
# Stop Flexera (or ManageSoft mgsusageag agent)

[[ ! -f /etc/init.d/mgsusageag ]] && return  # not present

if (( PREVIEW )) ; then
    Log "Stopping ManageSoft mgsusageag agent [not done in preview]"
else
    LogPrint "Stopping ManageSoft mgsusageag agent"
    [[ -x /etc/init.d/mgsusageag ]] && /etc/init.d/mgsusageag stop >&2
fi
