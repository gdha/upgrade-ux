# postexecute/GNI/Linux/45_enable_rhn_satellite_subscription.sh
# PREVIEW mode or not we moved it aside to be able to execute a patch check for updates

if (( rhn_satellite_subscription )) ; then
    LogPrint "Re-enable RHN Satellite Subscription"
    [[ -f /etc/sysconfig/rhn/systemid.$DS ]] && mv -f /etc/sysconfig/rhn/systemid.$DS /etc/sysconfig/rhn/systemid && return
    [[ -f "$VAR_DIR/$DS/systemid.rhn" ]] && mv -f "$VAR_DIR/$DS/systemid.rhn" /etc/sysconfig/rhn/systemid && return
    LogPrint "WARNING: Could not re-enable redhat satellite subscription - do it manually"
fi
