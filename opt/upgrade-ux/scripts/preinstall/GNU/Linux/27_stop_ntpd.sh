# 27_stop_ntp.sh
# We stop ntpd services to avoid problems with the docker filesystems - known issue
[ -n "$(pidof -x ntpd)" ] || return  # no ntpd running

if (( PREVIEW )) ; then
    Log "Stopping ntpd daemon [not done in preview]"
else
    LogPrint "Stopping ntpd daemon"
    service ntpd status  && service ntpd stop >&2
fi

