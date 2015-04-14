# 67_save_kcmodule.sh
# Verify if kcmodule output is produced as we have seen in the past that it may be corrupted
# and therefore, prevent system from booting after patching


[[ ! -x /usr/sbin/kcmodule ]] && return  # only for HP-UX 11.23 and 11.31

/usr/sbin/kcmodule > "$VAR_DIR/$DS/kcmodule.before"
rc=$?

if (( rc != 0 )) ; then
    if (( PREVIEW )) ; then
	LogPrint "ERROR: please raise an HP Support call to fix kcmodule failure."
    else
	Error "kcmodule produced a fatal error (please raise an HP Support call immediately)"
    fi
fi

