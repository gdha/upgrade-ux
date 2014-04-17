# 12_shutdown_dtconfig.sh
if (( PREVIEW )) ; then
    Log "Stopping CDE related processes [not done in preview]"
else
    LogPrint "Stopping CDE related processes"
    [[ -x /usr/dt/bin/dtconfig ]] && /usr/dt/bin/dtconfig -d >&2
    [[ -x /usr/dt/bin/dtconfig ]] && /usr/dt/bin/dtconfig -kill >&2
fi

