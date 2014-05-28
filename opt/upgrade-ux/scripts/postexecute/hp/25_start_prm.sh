# 25_start_prm.sh
# in case upgrade-ux runs in "upgrade" mode without rebooting then we need to check and restart it required 
# all prm related processes

if (( PREVIEW )) ;then
    : # not required in preview mode (as these processes are not stopped)
else
    LogPrint "Starting PRM (if necessary)"
    [[ -x /sbin/init.d/prm ]] && /sbin/init.d/prm start >&2
fi
