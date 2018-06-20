# postexecute/GNU/Linux/25_start_ntpd.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start ntp daemon"
    service ntpd status || service ntpd start >&2
fi
