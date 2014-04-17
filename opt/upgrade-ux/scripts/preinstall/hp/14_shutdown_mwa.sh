# 14_shutdown_mwa.sh
if (( PREVIEW )) ; then
    Log "Stopping MWA processes [not done in preview]"
else
    LogPrint "Stopping MWA processes"
    [[ -x /opt/perf/bin/mwa ]] && /opt/perf/bin/mwa stop >&2
fi

