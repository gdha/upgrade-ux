# 26_start_dtlogin.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Starting CDE desktop"
    [[ -x /usr/dt/bin/dtconfig ]] && /usr/dt/bin/dtconfig -e >&2
    [[ -x /usr/dt/bin/dtconfig ]] && /usr/dt/bin/dtconfig -start >&2
fi
