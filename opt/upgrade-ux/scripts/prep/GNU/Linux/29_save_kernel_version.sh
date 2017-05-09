# 29_save_kernel_version.sh
[[ -f "$VAR_DIR/$DS/kernel-version.before" ]] && return  # already saved

uname -r > "$VAR_DIR/$DS/kernel-version.before"
