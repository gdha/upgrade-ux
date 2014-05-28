# 28_start_mwa.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start MWA"
    [[ -x /opt/perf/bin/mwa ]] && /opt/perf/bin/mwa start >&2
fi
