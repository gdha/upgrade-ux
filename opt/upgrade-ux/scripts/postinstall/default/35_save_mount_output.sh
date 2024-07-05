# 35_save_mount_output.sh
# after patching we save another mount output as reference to proof patching was not to blame
# for certain not yet happened issues (you would be surprised what people blame patching for...)

mount > "$VAR_DIR/$DS/mount_output.after"

if [[ -f "$VAR_DIR/$DS/mount_output.before" ]]; then
    cmp -s "$VAR_DIR/$DS/mount_output.before" "$VAR_DIR/$DS/mount_output.after"
    if (( $? == 1 )) ; then
        LogPrint "The mount output is different after patching (see log)"
	sdiff -s "$VAR_DIR/$DS/mount_output.before" "$VAR_DIR/$DS/mount_output.after" >&2
    else
        Log "The mount output after patching is the same as before [ok]"
    fi
fi
