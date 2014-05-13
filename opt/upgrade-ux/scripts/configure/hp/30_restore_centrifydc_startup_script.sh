# 30_restore_centrifydc_startup_script.sh

[[ ! -x /usr/bin/adinfo ]] && return     # adinfo is not available when CentrifyDC is not installed

[[ ! -f "$VAR_DIR/$DS/centrifydc.version.before" ]]  &&  return  # cannot cmp so return
[[ ! -f "$VAR_DIR/$DS/centrifydc.version.after" ]]  &&  return  # cannot cmp so return

cmp -s "$VAR_DIR/$DS/centrifydc.version.before"  "$VAR_DIR/$DS/centrifydc.version.after"
if [[ $? -eq 1 ]]; then
    # centrifyDC has been updated; so make extra copy of /sbin/init.d/centrifydc
    cp /sbin/init.d/centrifydc  "/sbin/init.d/centrifydc.$(cat $VAR_DIR/$DS/centrifydc.version.after)"
    if (( PREVIEW )); then
	Log "Restored the original /sbin/init.d/centrifydc file [not in preview mode]"
    else
        cp "$VAR_DIR/$DS/centrifydc.before" /sbin/init.d/centrifydc
        chmod 755 /sbin/init.d/centrifydc
        Log "Restored the original /sbin/init.d/centrifydc file"
    fi
fi
