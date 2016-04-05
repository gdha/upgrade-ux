# 55_fix_uvscan_exclude_list.sh
# Script will add "/tmp/cfg2html_*" to the Symantec uvscan exclude.list file
# It is needed because sometime the temporary mount point of saving the cfg2html output (NAS filer)
# is not (yet) unmounted (or stays mounted for some reason) and the the daily uvscan of /tmp files
# would start scanning the complete cfg2html collection on the NAS filer which may bring down the
# network on slower remote locations (factories)

# perhaps it was already added - check it first
grep -q cfg2html /opt/uvscan/exclude.list && return  # nothing to be done

if (( PREVIEW )) ; then
    Log "Fix /opt/uvscan/exclude.list [not in preview mode]"
    return
fi

Log "Adding /tmp/cfg2html to /opt/uvscan/exclude.list"
cp -p /opt/uvscan/exclude.list "$VAR_DIR/$DS/exclude.list.after"
echo "/tmp/cfg2html_*" >> "$VAR_DIR/$DS/exclude.list.after"

# script prep/default/72_save_uvscan_exclude_list.sh created "$VAR_DIR/$DS/exclude.list.before"
cmp -s "$VAR_DIR/$DS/exclude.list.before" "$VAR_DIR/$DS/exclude.list.after"
if (( $? == 1 )); then
    LogPrint "Following was added to /opt/uvscan/exclude.list"
    sdiff -s $VAR_DIR/$DS/exclude.list.before" "$VAR_DIR/$DS/exclude.list.after"
    sdiff -s $VAR_DIR/$DS/exclude.list.before" "$VAR_DIR/$DS/exclude.list.after" >&2
    cp -p "$VAR_DIR/$DS/exclude.list.after" /opt/uvscan/exclude.list
fi
