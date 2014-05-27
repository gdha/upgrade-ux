# 23_save_shutdownlog.sh
[[ ! -f /etc/shutdownlog ]] && return
cp -p /etc/shutdownlog  "$VAR_DIR/$DS/shutdownlog.before"
