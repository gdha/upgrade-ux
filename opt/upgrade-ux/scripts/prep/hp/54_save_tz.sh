# 54_save_tz.sh

[[ ! -f /etc/default/tz ]]  &&  return   # no tz found on the place we expected

[[ -f "$VAR_DIR/$DS/tz.before" ]] && return  # we already have a copy

cp -p /etc/default/tz "$VAR_DIR/$DS/tz.before"

