# 74_save_sudoers.sh

[[ ! -f /etc/sudoers ]] && return  # no sudo installed

cp -p /etc/sudoers "$VAR_DIR/$DS/sudoers.before"
