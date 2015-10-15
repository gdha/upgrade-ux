# 33_restart_apache.sh
if (( PREVIEW )) ; then
    return
fi


if [[ -f "$VAR_DIR/$DS/CVE-2015-4000" ]]; then
    # OpenSSL LogJam issue detected
    [[ -x /etc/init.d/hpsmhd ]] && /etc/init.d/hpsmhd restart >&2
    [[ -x /etc/init.d/httpd ]] && /etc/init.d/httpd restart >&2
    [[ -x /opt/NAI/LinuxShield/apache/bin/apachectl ]] && /opt/NAI/LinuxShield/apache/bin/apachectl restart >&2
fi

