# 85_init_level_3_check.sh
# when we are done with patching make sure that our init level has been set back to 3
# if that is not the case then we will do this automatically as UNIX Operations forgets
# to adapth this after patching (seen this too many times)

i=$( grep ^init /etc/inittab | cut -d: -f2 )  # should be 3, but could be 2
if [[ $i -eq 2 ]] ; then
    # only take action when init level is at 2
    # make a copy before changing inittab
    cp -p /etc/inittab "$VAR_DIR/$DS/inittab.before"
    sed -e 's/^init:2.*/init:3:initdefault:/' < "$VAR_DIR/$DS/inittab.before" > "$VAR_DIR/$DS/inittab.after"
    if (( PREVIEW )) ; then
        LogPrint "Changing init-level from 2 to 3 in /etc/inittab (not in preview mode)"
    else
        LogPrint "Changing init-level from 2 to 3 in /etc/inittab"
        cp "$VAR_DIR/$DS/inittab.after" /etc/inittab
        chown root:sys /etc/inittab
        chmod 444 /etc/inittab
    fi
fi
