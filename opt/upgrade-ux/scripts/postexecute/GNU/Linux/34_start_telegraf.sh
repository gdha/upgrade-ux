# postexecute/GNU/Linux/34_start_telegraf.sh
# Start telegraf
if (( PREVIEW )) ; then
    :
else
    [[ -f /usr/bin/telegraf ]] || return  # no telegraf present - just return
    LogPrint "Start the telegraf service"
    service telegraf status || service telegraf start >&2
fi
