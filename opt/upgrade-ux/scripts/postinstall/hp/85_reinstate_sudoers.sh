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
    Log "Copy back the original /etc/sudoers file"
    mv -f /etc/sudoers /etc/sudoers.$SUDOVER         # move the fresh sudoers file
    cp -p "$VAR_DIR/$DS/sudoers.before" /etc/sudoers # re-instate the original sudoers
    chown root:root /etc/sudoers
    chmod 440 /etc/sudoers
fi
