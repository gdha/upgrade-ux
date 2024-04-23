# preinstall/GNU/Linux/36_stop_telegraf.sh
# Stop telegraf agent to avoid incident logging during patching

service telegraf status >&2 || return

if (( PREVIEW )) ; then
    Log "Stopping telegraf agent  [not done in preview]"
else
    LogPrint "Stopping telegraf agent"
    service telegraf stop >&2
fi
