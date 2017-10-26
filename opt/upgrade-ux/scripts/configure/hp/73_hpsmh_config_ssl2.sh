# 73_hpsmh_config_ssl2.sh

# ON HP-UX 11.31 there is no --disable-sslv2 option available with smhconfig
# See also issue #73
[[ "$OS_VERSION"  = "11.31" ]]  && return   # no need to check

# The purpose is to add in /opt/hpsmh/conf.common/smhpd.xml
# <disable-sslv2>false</disable-sslv2><admin-kerberos/>
if (( PREVIEW )) ; then
    Log "Do not disable SSLv2 in hpsmh with OpenSSL A.01.00.02 [not in preview mode]"
else
    Log "Do not disable SSLv2 in hpsmh with OpenSSL A.01.00.02"
    /opt/hpsmh/bin/smhconfig --disable-sslv2=false >&2
fi
