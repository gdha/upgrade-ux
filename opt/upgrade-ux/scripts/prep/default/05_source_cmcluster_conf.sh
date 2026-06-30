# 05_source_cmcluster_conf.sh
# on HP-UX we typically find it as /etc/cmcluster.conf
# SGCONF=/etc/cmcluster
# SGSBIN=/usr/sbin
# SGLBIN=/usr/lbin
# SGLIB=/usr/lib
# SGRUN=/var/adm/cmcluster
# SGAUTOSTART=/etc/rc.config.d/cmcluster
# SGFFLOC=/opt/cmcluster/cmff
# CMSNMPD_LOG_FILE=/var/adm/SGsnmpsuba.log

# on Linux it is also /etc/cmcluster.conf
# SGCONF=/usr/local/cmcluster/conf
# SGSBIN=/usr/local/cmcluster/bin
# SGLBIN=/usr/local/cmcluster/bin
# SGLIB=/usr/local/cmcluster/lib
# SGRUN=/usr/local/cmcluster/run
# SGAUTOSTART=/usr/local/cmcluster/conf/cmcluster.rc
# SGROOT=/usr/local/cmcluster

if [[ -f /etc/cmcluster.conf ]]; then
    # Security: only source the file if it is owned by root to prevent privilege
    # escalation via a world-writable or attacker-controlled cluster config.
    _cmcl_owner=$(stat -c '%U' /etc/cmcluster.conf 2>/dev/null || stat -f '%Su' /etc/cmcluster.conf 2>/dev/null)
    if [[ "$_cmcl_owner" != "root" ]]; then
        LogPrint "WARNING: /etc/cmcluster.conf is not owned by root (owner: ${_cmcl_owner:-unknown}) - skipping source"
    else
        . /etc/cmcluster.conf
    fi
fi

# adding the paths to serviceguard executables to the path
PATH=$PATH:$SGSBIN:$SGLBIN
export PATH
