# prep/GNU/Linux/41_disable_rhn_satellite_subscription.sh

if (( rhn_satellite_subscription )) ; then
    # PREVIEW or not we must do it otherwise we cannot check the patch updates in preview mode
    LogPrint "Temporarely disabling RHN Satellite Subscription"
    mv -f /etc/sysconfig/rhn/systemid /etc/sysconfig/rhn/systemid.$DS
fi
