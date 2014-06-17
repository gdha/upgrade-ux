# 45_disable_swat_in_inetd.sh

[[ ! -f "$VAR_DIR/$DS/inetd_conf.after" ]] && cp -p /etc/inetd.conf "$VAR_DIR/$DS/inetd_conf.after"

grep -v \# "$VAR_DIR/$DS/inetd_conf.after" | grep -q ^swat
if (( $? == 0 )); then
    # we found an active entry; we should disable it. We will create a inetd_conf.new first
    LogPrint "Disable the swat line in inetd.conf file"
    sed -e 's/^swat/#swat/g' < "$VAR_DIR/$DS/inetd_conf.after"  > "$VAR_DIR/$DS/inetd_conf.new"
    cp "$VAR_DIR/$DS/inetd_conf.new" /etc/inetd.conf
    chown root:sys /etc/inetd.conf
    chmod 644 /etc/inetd.conf
    LogPrint "Inetd daemon re-reads its inetd.conf file now"
    /usr/sbin/inetd -c
fi
