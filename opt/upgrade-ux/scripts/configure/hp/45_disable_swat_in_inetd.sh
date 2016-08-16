# 45_disable_swat_in_inetd.sh

[[ ! -f "$VAR_DIR/$DS/inetd_conf.after" ]] && cp -p /etc/inetd.conf "$VAR_DIR/$DS/inetd_conf.after"

grep -v \# "$VAR_DIR/$DS/inetd_conf.after" | grep -q ^swat
if (( $? == 0 )); then
    # we found an active entry; we should disable it. We will create a inetd_conf.new first
    Log "Disable the swat line in $VAR_DIR/$DS/inetd_conf.new file"
    sed -e 's/^swat/#swat/g' < "$VAR_DIR/$DS/inetd_conf.after"  > "$VAR_DIR/$DS/inetd_conf.new"
    if (( PREVIEW )) ; then
        Log "The \"swat\" entry in /etc/inetd.conf must be commented [not in preview mode]"
    else
        Log "Copy $VAR_DIR/$DS/inetd_conf.new to /etc/inetd.conf"
        cp -p "$VAR_DIR/$DS/inetd_conf.new" /etc/inetd.conf
        chown root:sys /etc/inetd.conf
        chmod 644 /etc/inetd.conf
        Log "Inetd daemon re-reads its inetd.conf file now"
        /usr/sbin/inetd -c
    fi
fi
