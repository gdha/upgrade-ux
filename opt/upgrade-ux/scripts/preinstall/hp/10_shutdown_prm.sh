# 10_shutdown_prm.sh
# stop all prm related daemons before patching
if (( PREVIEW )) ; then
    Log "Stopping PRM related processes [not done in preview]"
else
    LogPrint "Stopping PRM related processes"
    [[ -x /opt/prm/bin/prmconfig ]] && /opt/prm/bin/prmconfig -r >&2
    [[ -x /opt/prm/bin/prm3d ]] && /opt/prm/bin/prm3d -stop >&2
    [[ -x /opt/prm/bin/prmagt ]] && /opt/prm/bin/prmagt -stop >&2
    /sbin/init.d/prm stop >&2
fi
