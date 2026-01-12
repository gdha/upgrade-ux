# prep/GNU/Linux/57_save_dpkg_installed.sh

[[ ! -x $DPKG ]] && return  # dpkg not available, silent return

[[ -f "$VAR_DIR/$DS/${HOSTNAME}_dpkg_installed.before" ]] && return  # we have the output already

$DPKG --get-selections > "$VAR_DIR/$DS/${HOSTNAME}_dpkg_installed.before"
Log "Saved output of 'dpkg --get-selections' before patching in $VAR_DIR/$DS/${HOSTNAME}_dpkg_installed.before"
