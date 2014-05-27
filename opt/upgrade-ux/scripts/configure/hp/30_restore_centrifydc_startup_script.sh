# 30_restore_centrifydc_startup_script.sh

[[ ! -x /usr/bin/adinfo ]] && return     # adinfo is not available when CentrifyDC is not installed

# ls -l centrifydc-adinfo*.after
# -rw-r--r--   1 root       sys            272 May 23 09:41 centrifydc-adinfo-3.0.5-506.after
# -rw-------   1 root       sys            372 May 23 10:33 centrifydc-adinfo-5.1.1-831.after

if (( $(ls -l $VAR_DIR/$DS/centrifydc-adinfo*.after | wc -l) > 1 )) ; then
    # centrifyDC has been updated; so make extra copy of /sbin/init.d/centrifydc
    if (( PREVIEW )); then
	Log "Restored the original /sbin/init.d/centrifydc file [not in preview mode]"
    else
        cp -p "$VAR_DIR/$DS/centrifydc.before" /sbin/init.d/centrifydc
        chmod 755 /sbin/init.d/centrifydc
        Log "Restored the original /sbin/init.d/centrifydc file"
    fi
fi
