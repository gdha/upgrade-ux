# 10_save_rc_log.sh

[[ ! -f /etc/rc.log ]] && return

cp /etc/rc.log  $VAR_DIR/etc/rc.log.$DS
