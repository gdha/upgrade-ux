# postinstall/GNU/Linux/30_save_apt_installed.sh

(( PREVIEW )) && return  # return in preview mode

# only for Debian-alike systems
[[ ! -x $APT ]] && return  # apt not available, silent return

$APT list --installed > "$VAR_DIR/$DS/${HOSTNAME}_apt_installed.after"
Log "Saved output of 'apt list --installed' after patching in $VAR_DIR/$DS/${HOSTNAME}_apt_installed.after"
