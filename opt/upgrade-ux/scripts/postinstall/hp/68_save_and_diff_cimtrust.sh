# 68_save_and_diff_cimtrust.sh
# HP SIM cimtrust certificates - save current list
[[ ! -x /opt/wbem/sbin/cimtrust ]] && return

/opt/wbem/sbin/cimtrust -l > "$VAR_DIR/$DS/cimtrust.after"

[[ ! -f "$VAR_DIR/$DS/cimtrust.before" ]] && return

cmp -s "$VAR_DIR/$DS/cimtrust.after" "$VAR_DIR/$DS/cimtrust.before"
if (( $? == 1 )); then
    LogPrint "Cim X509 certificates differ:"
    sdiff -s "$VAR_DIR/$DS/cimtrust.after" "$VAR_DIR/$DS/cimtrust.before" >&2
fi
