# postinstall/GNU/Linux/30_save_rpm_qa.sh

(( PREVIEW )) && return  # return in preview mode

[[ ! -x $RPM ]] && return  # rpm executable not available; just return

$RPM -qa --last > "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.after"
Log "Saved the 'rpm -qa --last' output after patching in $VAR_DIR/$DS/${HOSTNAME}_rpm_qa.after"
