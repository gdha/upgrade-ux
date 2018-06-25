# postexecute/GNU/Linux/25_start_ntpd.sh
[ -n "$(pidof -x ntpd)" ] || return  # no ntpd running

if (( PREVIEW )) ; then
    :
else
    LogPrint "Start ntpd daemon"
    service ntpd status || service ntpd start >&2
fi
