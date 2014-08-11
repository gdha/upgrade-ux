# 57_save_rc_log.sh

[[ ! -f /etc/rc.log ]] && return

cp -p /etc/rc.log  "$VAR_DIR/$DS/rc.log.before"
