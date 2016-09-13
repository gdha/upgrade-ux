# 74_apachectl_smhpd_conf.sh
[[ ! -x /opt/hpws22/apache/bin/apachectl ]] && return  # means hpuxws22APACHE is not installed

[[ ! -f /opt/hpsmh/conf/smhpd.conf ]] && return  # hpsmh is not installed

Log "Verify the HP System Management Homepage configuration"

/opt/hpws22/apache/bin/apachectl -t -f /opt/hpsmh/conf/smhpd.conf >&2
