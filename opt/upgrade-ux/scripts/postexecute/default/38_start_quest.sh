# 38_start_quest.sh
[[ ! -f /opt/quest/umi/sbin/quest-owcimomd_init ]] && return

if (( PREVIEW )) ; then
    :
else
    LogPrint "Start Quest qmxcmd"
    /opt/quest/qmxcm/sbin/qmxcmd_init start >&2
    LogPrint "Start Quest owcimomd daemon"
    /opt/quest/umi/sbin/quest-owcimomd_init start >&2
fi
