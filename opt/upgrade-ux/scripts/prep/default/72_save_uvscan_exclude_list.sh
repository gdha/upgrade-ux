# 72_save_uvscan_exclude_list.sh
# purpose is to save the original /opt/uvscan/exclude.list file in our $DS folder
# later in the configure part we will append "/tmp/cfg2html_*" to the exclude.list

[[ ! -f /opt/uvscan/exclude.list ]] && return   # not present; just silently return

if [[ ! -f "$VAR_DIR/$DS/exclude.list.before" ]]; then
    Log "Saving a copy of /opt/uvscan/exclude.list"
    cp /opt/uvscan/exclude.list "$VAR_DIR/$DS/exclude.list.before"
fi
