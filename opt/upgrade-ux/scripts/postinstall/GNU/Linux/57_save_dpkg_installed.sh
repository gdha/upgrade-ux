# postinstall/GNU/Linux/57_save_dpkg_installed.sh

# only for Debian-alike systems
[[ ! -x $DPKG ]] && return  # dpkg not available, silent return

(( PREVIEW )) && return  # do not exit in preview mode

$DPKG --get-selections > "$VAR_DIR/$DS/${HOSTNAME}_dpkg_installed.after"
Log "Saved output of 'dpkg --get-selections' after patching in $VAR_DIR/$DS/${HOSTNAME}_dpkg_installed.after"
