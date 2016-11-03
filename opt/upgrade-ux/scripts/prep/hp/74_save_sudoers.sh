# 74_save_sudoers.sh

[[ ! -f /etc/sudoers ]] && return  # no sudo installed

[[ -f "$VAR_DIR/$DS/sudoers.before" ]] && return  # try to avoid overwrite the original copy

cp -p /etc/sudoers "$VAR_DIR/$DS/sudoers.before"

# to protect ourself we will take a second copy in /etc/ directory itself
# and make sure it cannot be overwritten
[[ -f  /etc/sudoers.${PRODUCT}.before ]] && return
cp -p /etc/sudoers /etc/sudoers.${PRODUCT}.before
