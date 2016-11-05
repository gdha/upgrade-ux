# 85_reinstate_sudoers.sh
# it is the purpose here to save a copy of the current /etc/sudoers file and move it
# to /etc/sudoers.1.7.10p9
# and copy back the original saved sudoers file to /etc

# if we do not have a sudoers.before file then there is nothing we can do I am afraid
[[ ! -f "$VAR_DIR/$DS/sudoers.before" ]] && return

# retrieve the current installed version
SUDOVER=$( $SWLIST sudo 2>/dev/null | grep \# | tail -1 | awk '{print $3}' )
[[ "$SUDOVER" = "target" ]] && SUDOVER=1.7.10p9  # means sudo was not installed

# if we do not have a /etc/sudoers then there is not much we can do
[[ ! -f /etc/sudoers ]] && return

if (( PREVIEW )) ; then
    Log "Copy back the original /etc/sudoers file [not in preview]"
else
    Log "Move the original /etc/sudoers file to /etc/sudoers.$SUDOVER"
    mv -f /etc/sudoers /etc/sudoers.$SUDOVER         # move the fresh sudoers file
    # we have 2 copies "$VAR_DIR/$DS/sudoers.before" and "/etc/sudoers.$PRODUCT.before"
    # and these should be the same - if not only use "/etc/sudoers.$PRODUCT.before" to copy back
    if [[ -f "/etc/sudoers.${PRODUCT}.before" ]] ; then
        cmp -s "$VAR_DIR/$DS/sudoers.before" "/etc/sudoers.${PRODUCT}.before"
        if (( $? == 1 )); then
            # if these files are not the same use the /etc/sudoers.${PRODUCT}.before one
            Log "Using /etc/sudoers.${PRODUCT}.before to copy back to /etc/sudoers"
            cp -p "/etc/sudoers.${PRODUCT}.before" /etc/sudoers
        else
            Log "Using $VAR_DIR/$DS/sudoers.before to copy back to /etc/sudoers"
            cp -p "$VAR_DIR/$DS/sudoers.before" /etc/sudoers # re-instate the original sudoers
        fi
    else
        # faillback in case /etc/sudoers.${PRODUCT}.before did not exist
        Log "Using $VAR_DIR/$DS/sudoers.before to copy back to /etc/sudoers"
        cp -p "$VAR_DIR/$DS/sudoers.before" /etc/sudoers # re-instate the original sudoers
    fi
    chown root:root /etc/sudoers
    chmod 440 /etc/sudoers
fi

# an extra step to verify the /etc/sudoers was not deleted by accident
if [[ ! -f /etc/sudoers ]] ; then
    LogPrint "ERROR: File /etc/sudoers does not exist!"
fi
