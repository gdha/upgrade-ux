# 38_start_quest.sh
(( PREVIEW )) && return

if [[ -f /opt/quest/qmxcm/sbin/qmxcmd_init ]] ; then
    LogPrint "Start Quest qmxcmd"
    /opt/quest/qmxcm/sbin/qmxcmd_init start >&2
fi
if [[ -f /opt/quest/umi/sbin/quest-owcimomd_init ]] ; then
    LogPrint "Start Quest owcimomd daemon"
    /opt/quest/umi/sbin/quest-owcimomd_init start >&2
fi
