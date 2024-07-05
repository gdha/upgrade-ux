# preinstall/GNU/Linux/32_stop_tanium.sh
# Stop TaniumClient before proceeding as it can cause rpmdb corruption

service taniumclient status >&2 || return

if (( PREVIEW )) ; then
    Log "Stopping TaniumClient services  [not done in preview]"
else
    LogPrint "Stopping TaniumClient services"
    service taniumclient stop >&2
fi
