# 24_shutdown_snmp.sh

if (( PREVIEW )) ; then
    Log "Stopping SNMP daemons [not done in preview]"
else
    if [[ -x /sbin/init.d/SnmpMaster ]] ; then
        LogPrint "Stopping SnmpMaster"
        /sbin/init.d/SnmpMaster stop  >&2
    fi
    if [[ -x /sbin/init.d/SnmpHpunix ]] ; then
        LogPrint "Stopping SnmpHpunix"
        /sbin/init.d/SnmpHpunix stop  >&2
    fi
    if [[ -x /sbin/init.d/SnmpIpv6 ]] ; then
        LogPrint "Stopping SnmpIpv6"
        /sbin/init.d/SnmpIpv6 stop    >&2
    fi
    if [[ -x /sbin/init.d/cmsnmpagt ]] ; then
        LogPrint "Stopping cmsnmpagt"
        /sbin/init.d/cmsnmpagt stop   >&2
    fi
fi
