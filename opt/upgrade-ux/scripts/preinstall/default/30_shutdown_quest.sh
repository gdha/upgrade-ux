# 30_shutdown_quest.sh
# runs on Linux, HP-UX

[[ ! -f /opt/quest/umi/sbin/quest-owcimomd_init ]] && return

if (( PREVIEW )) ; then
    Log "Stopping Quest owcimomd daemon [not done in preview]"
else
    LogPrint "Stopping Quest owcimomd daemon"
    /opt/quest/umi/sbin/quest-owcimomd_init stop >&2
fi

[[ ! -f /opt/quest/qmxcm/sbin/qmxcmd_init ]] && return

if (( PREVIEW )) ; then
    Log "Stopping Quest qmxcmd [not done in preview]"
else
    LogPrint "Stopping Quest qmxcmd"
    /opt/quest/qmxcm/sbin/qmxcmd_init stop >&2
fi
