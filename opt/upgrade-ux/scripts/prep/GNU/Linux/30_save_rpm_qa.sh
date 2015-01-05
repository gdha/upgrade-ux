# prep/GNU/Linux/30_save_rpm_qa.sh

[[ -f "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before" ]] && return  # we have the output already

[[ ! -x $RPM ]] && return  # rpm executable not available; just return

$RPM -qa > "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before"
