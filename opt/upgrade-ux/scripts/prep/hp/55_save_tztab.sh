# 55_save_tztab.sh

[[ ! -f /usr/lib/tztab ]]   &&  return

[[ -f "$VAR_DIR/$DS/tztab.before" ]] && return  # we already have a copy

cp -p /usr/lib/tztab "$VAR_DIR/$DS/tztab.before"
