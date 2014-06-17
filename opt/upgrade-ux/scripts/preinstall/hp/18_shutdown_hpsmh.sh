# 18_shutdown_hpsmh.sh
if (( PREVIEW )) ; then
    Log "Stopping HP System Mgmt Homepage processes [not done in preview]"
else
    LogPrint "Stopping HP System Mgmt Homepage processes"
    [[ -x /sbin/init.d/hpsmh ]] && /sbin/init.d/hpsmh stop >&2
    # as SMH caused update-ux to hang we do a 2th check
    netstat -a | grep -q 2301
    if (( $? == 0 )) ; then
        LogPrint "smh is still running - force a kill of smh"
	KillProc smh
    fi
fi

