# 71_save_nddconf.sh

[[ ! -f /etc/rc.config.d/nddconf ]]  && return  # should not happen

[[ -f "$VAR_DIR/$DS/nddconf.before" ]]  && return  # one copy is enough

cp -p /etc/rc.config.d/nddconf "$VAR_DIR/$DS/nddconf.before"
