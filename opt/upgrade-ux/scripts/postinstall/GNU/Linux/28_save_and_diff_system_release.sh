# 28_save_and_diff_system_release.sh

[[ ! -f /etc/system-release ]] && return

cp /etc/system-release "$VAR_DIR/$DS/system-release.after"

[[ ! -f "$VAR_DIR/$DS/system-release.before" ]] && return  # should never be true

cmp -s "$VAR_DIR/$DS/system-release.before" "$VAR_DIR/$DS/system-release.after"
if (( $? == 1 )); then
    LogPrint "System was upgraded to $(cat $VAR_DIR/$DS/system-release.after)"
fi
