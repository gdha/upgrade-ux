# 74_save_sudoers.sh

[[ ! -f /etc/sudoers ]] && return  # no sudo installed

if [[ ! -f "$VAR_DIR/$DS/sudoers.before" ]] ; then
    cp -p /etc/sudoers "$VAR_DIR/$DS/sudoers.before"
fi

# To protect ourselves we will take a second copy in /etc/ directory itself
# and make sure it cannot be overwritten
if [[ ! -f  /etc/sudoers.${PRODUCT}.${YEAR} ]] ; then
    cp -p /etc/sudoers /etc/sudoers.${PRODUCT}.${YEAR}
fi
