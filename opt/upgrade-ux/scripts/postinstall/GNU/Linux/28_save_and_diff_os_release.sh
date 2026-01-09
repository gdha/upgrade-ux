# 28_save_and_diff_os_release.sh

[[ ! -f /etc/os-release ]] && return

cp /etc/os-release "$VAR_DIR/$DS/os-release.after"

[[ ! -f "$VAR_DIR/$DS/os-release.before" ]] && return  # should never be true

cmp -s "$VAR_DIR/$DS/os-release.before" "$VAR_DIR/$DS/os-release.after"
if (( $? == 1 )); then
    LogPrint "System was upgraded to $(grep ^PRETTY_NAME $VAR_DIR/$DS/os-release.after | cut -d\" -f2)"
fi
