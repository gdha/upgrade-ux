# prep/GNU/Linux/30_save_rpm_qa.sh

[[ -f "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before" ]] && return  # we have the output already

[[ ! -x $RPM ]] && return  # rpm executable not available; just return

$RPM -qa --last > "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before"
Log "Saved the 'rpm -qa --last' output before patching in $VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before"
