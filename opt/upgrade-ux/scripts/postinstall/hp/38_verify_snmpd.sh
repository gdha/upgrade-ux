# 38_verify_snmpd.sh

[[ -h /etc/snmpd.conf ]] && return   # if /etc/snmpd.conf is a link then we are good

if [[ -f /etc/SnmpAgent.d/snmpd.conf ]]; then
    rm -f /etc/snmpd.conf 
    ln -s /etc/SnmpAgent.d/snmpd.conf /etc/snmpd.conf
    Log "Created a symbolic link from /etc/SnmpAgent.d/snmpd.conf to /etc/snmpd.conf"
fi

# check for a proper get-community-name definition
grep -q ^get-community-name /etc/SnmpAgent.d/snmpd.conf
if (( $? == 1 )); then
    LogPrint "No Community Name was defined in /etc/SnmpAgent.d/snmpd.conf"
    LogPrint "Please do the needfull and restart the snmpd process manually"
fi
