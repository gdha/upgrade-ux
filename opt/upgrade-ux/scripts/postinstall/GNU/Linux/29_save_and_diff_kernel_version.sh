# 29_save_and_diff_kernel_version.sh

uname -r > "$VAR_DIR/$DS/kernel-version.after"

[[ ! -f "$VAR_DIR/$DS/kernel-version.before" ]] && return  # should never be the case

cmp -s "$VAR_DIR/$DS/kernel-version.before" "$VAR_DIR/$DS/kernel-version.after"
if (( $? == 1 )); then
    LogPrint "Kernel was updated from $(cat $VAR_DIR/$DS/kernel-version.before) to $($VAR_DIR/$DS/kernel-version.after)"
fi
