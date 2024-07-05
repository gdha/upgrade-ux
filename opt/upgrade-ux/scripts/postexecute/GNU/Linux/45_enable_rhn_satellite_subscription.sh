# postexecute/GNI/Linux/45_enable_rhn_satellite_subscription.sh
# PREVIEW mode or not we moved it aside to be able to execute a patch check for updates

# In some case when upgrade-ux was interrupted due to an error the systemid file was not moved back
# to its original name, and therefore, in a 2th run we would assume there was no rhn subscription present.
# However, before we started rhn subscription was there as file "$VAR_DIR/$DS/systemid.rhn" exists.
# So, we check for this file and if present we make variable rhn_satellite_subscription=1
[[ -f "$VAR_DIR/$DS/systemid.rhn" ]] && rhn_satellite_subscription=1

if (( rhn_satellite_subscription )) ; then
    LogPrint "Re-enable RHN Satellite Subscription"
    [[ -f /etc/sysconfig/rhn/systemid.$DS ]] && mv -f /etc/sysconfig/rhn/systemid.$DS /etc/sysconfig/rhn/systemid && return
    [[ -f "$VAR_DIR/$DS/systemid.rhn" ]] && cp -f "$VAR_DIR/$DS/systemid.rhn" /etc/sysconfig/rhn/systemid && return
    LogPrint "WARNING: Could not re-enable redhat satellite subscription - do it manually"
fi
