# 67_save_and_diff_kcmodule.sh
# Verify if kcmodule output is produced as we have seen in the past that it may be corrupted

[[ ! -x /usr/sbin/kcmodule ]] && return  # only for HP-UX 11.23 and 11.31

/usr/sbin/kcmodule > "$VAR_DIR/$DS/kcmodule.after"
rc=$?

if (( rc != 0 )) ; then
    if (( PREVIEW )) ; then
	LogPrint "ERROR: please raise an HP Support call to fix kcmodule failure."
    else
	LogPrint "ERROR: kcmodule produced a fatal error (please raise an HP Support call immediately)"
    fi
fi

[[ ! -f "$VAR_DIR/$DS/kcmodule.before" ]] && return

cmp -s "$VAR_DIR/$DS/kcmodule.after" "$VAR_DIR/$DS/kcmodule.before"
if (( $? == 1 )); then
    LogPrint "Kernel modules difference after patching:"
    sdiff -s "$VAR_DIR/$DS/kcmodule.after" "$VAR_DIR/$DS/kcmodule.before"
fi
