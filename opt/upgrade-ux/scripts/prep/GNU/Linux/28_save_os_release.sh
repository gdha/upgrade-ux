# 28_save_os_release.sh

[[ ! -f /etc/os-release ]] && return

[[ -f "$VAR_DIR/$DS/os-release.before" ]]  && return   # already saved

cp /etc/os-release "$VAR_DIR/$DS/os-release.before"
