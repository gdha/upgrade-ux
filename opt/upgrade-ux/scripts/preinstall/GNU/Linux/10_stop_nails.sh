# preinstall/GNU/Linux/10_stop_nails.sh
# stop the McAfee LinuxShield anti-virus services

[[ ! -f /etc/init.d/nails ]] && return  # not present

if (( PREVIEW )) ; then
    Log "Stopping McAfee LinuxShield anti-virus services [not done in preview]"
else
    LogPrint "Stopping McAfee LinuxShield anti-virus services"
    [[ -x /etc/init.d/nails ]] && /etc/init.d/nails stop >&2
fi

