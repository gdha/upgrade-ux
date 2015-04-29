# 68_save_cimtrust.sh
# HP SIM cimtrust certificates - save current list
[[ ! -x /opt/wbem/sbin/cimtrust ]] && return

/opt/wbem/sbin/cimtrust -l > "$VAR_DIR/$DS/cimtrust.before"
