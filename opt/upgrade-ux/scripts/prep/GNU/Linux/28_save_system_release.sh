# 28_save_system_release.sh

[[ -f "$VAR_DIR/$DS/system-release.before" ]]  && return   # already saved

cp /etc/system-release "$VAR_DIR/$DS/system-release.before"
