# 51_save_inetd.sh

[[ ! -f /etc/inetd.conf ]] && return  # this must be a crippled system!

cp -p /etc/inetd.conf "$VAR_DIR/$DS/inetd_conf.after" 
