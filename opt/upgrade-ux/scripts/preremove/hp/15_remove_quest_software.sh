# 15_remove_quest_software.sh
# Remove Quest software - obsolete

if [[ -x /opt/quest/qmxsms/bin/uninstall_client.sh ]] ; then
    if (( PREVIEW )) ; then
        Log "Remove Quest software [not in preview mode]"
    else
        LogPrint "Remove Quest software"
        /opt/quest/qmxsms/bin/uninstall_client.sh >&2
    fi
fi

if [[ -x /opt/quest/qmxsms/bin/uninstall_qmx_client.sh ]] ; then
    if (( PREVIEW )) ; then
        Log "Remove Quest software [not in preview mode]"
    else
        LogPrint "Remove Quest software"
        /opt/quest/qmxsms/bin/uninstall_qmx_client.sh >&2
    fi
fi
