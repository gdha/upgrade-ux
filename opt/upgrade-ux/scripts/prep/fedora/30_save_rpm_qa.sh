[[ -f "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before" ]] && return  # we have the output already

$RPM -qa > "$VAR_DIR/$DS/${HOSTNAME}_rpm_qa.before"
