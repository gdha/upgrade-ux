# 17_check_last_ignite.sh
#########################
# verify if this system has a recent ignite/ux image backup

if [[ ! -f /var/opt/ignite/recovery/previews ]]; then
    Error "No Ignite/UX image backup was made of this system. Act now."
fi

# save a copy of this file
cp  /var/opt/ignite/recovery/previews $VAR_DIR/$DS/ignite.previews
Log "Last Ignite/UX image backup was made on $(grep last_preview $VAR_DIR/$DS/ignite.previews | cut -d= -f2)"
Log "All info on Ignite/UX is stored in $VAR_DIR/$DS/ignite.previews"
