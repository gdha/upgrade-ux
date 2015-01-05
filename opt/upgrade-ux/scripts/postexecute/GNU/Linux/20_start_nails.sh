# postexecute/GNU/Linux/20_start_nails.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start McAfee LinuxShield anti-virus services"
    [[ -x /etc/init.d/nails ]] && /etc/init.d/nails start >&2
fi
