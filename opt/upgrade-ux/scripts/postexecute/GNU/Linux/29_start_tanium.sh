# postexecute/GNU/Linux/29_start_tanium.sh
# Start TaniumClient
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start TaniumClient services"
    service taniumclient status || service taniumclient start >&2
fi
