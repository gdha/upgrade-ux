# 51_save_inetd.sh

[[ ! -f /etc/inetd.conf ]] && return  # this must be a crippled system!

[[ -f "$VAR_DIR/$DS/inetd_conf.before" ]] && return  # we already have a copy

cp -p /etc/inetd.conf "$VAR_DIR/$DS/inetd_conf.before" 
