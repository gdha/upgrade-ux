# postinstall/GNU/Linux/30_save_rpm_qa.sh

[[ ! -x $RPM ]] && return  # rpm executable not available; just return

$RPM -qa > "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.after"
Log "Saved the 'rpm -qa' output after patching in $VAR_DIR/$DS/${HOSTNAME}_rpm_qa.after"
