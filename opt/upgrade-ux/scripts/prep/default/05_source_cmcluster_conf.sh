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
    . /etc/cmcluster.conf
fi

# adding the paths to serviceguard executables to the path
PATH=$PATH:$SGSBIN:$SGLBIN
export PATH
