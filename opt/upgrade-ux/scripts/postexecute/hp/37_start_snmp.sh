# 37_start_snmp.sh

if (( PREVIEW )) ; then
    Log "Starting SNMP daemons [not done in preview]"
else
    if [[ -x /sbin/init.d/SnmpMaster ]] ; then
        LogPrint "Starting SnmpMaster"
        /sbin/init.d/SnmpMaster start  >&2
    fi
    if [[ -x /sbin/init.d/SnmpHpunix ]] ; then
        LogPrint "Starting SnmpHpunix"
        /sbin/init.d/SnmpHpunix start  >&2
    fi
    if [[ -x /sbin/init.d/SnmpIpv6 ]] ; then
        LogPrint "Starting SnmpIpv6"
        /sbin/init.d/SnmpIpv6 start    >&2
    fi
    if [[ -x /sbin/init.d/cmsnmpagt ]] ; then
        LogPrint "Starting cmsnmpagt"
        /sbin/init.d/cmsnmpagt start   >&2
    fi
fi
