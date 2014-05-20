# 53_save_sshd_config.sh

[[ ! -f /opt/ssh/etc/sshd_config ]]  &&  return   # no sshd_config found on the place we expected

[[ -f "$VAR_DIR/$DS/sshd_config.before" ]] && return  # we already have a copy

cp -p /opt/ssh/etc/sshd_config "$VAR_DIR/$DS/sshd_config.before"

