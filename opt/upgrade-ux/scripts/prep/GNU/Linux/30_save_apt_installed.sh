# prep/GNU/Linux/30_save_apt_installed.sh

[[ -f "$VAR_DIR/$DS/${HOSTNAME}_apt_installed.before" ]] && return  # we have the output already

[[ ! -x $APT ]] && return  # apt not available, silent return

$APT list --installed > "$VAR_DIR/$DS/${HOSTNAME}_apt_installed.before"
Log "Saved output of 'apt list --installed' before patching in $VAR_DIR/$DS/${HOSTNAME}_apt_installed.before"
