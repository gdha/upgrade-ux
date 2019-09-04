# 76_save_nsswitch.conf

if [[ ! -f /etc/nsswitch.conf ]] ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: please create an /etc/nsswitch.conf file"
        return
    else
        Error "Please create an /etc/nsswitch.conf file (use /etc/nsswitch.hp_defaults as basis)"
    fi
fi

[[ -f "$VAR_DIR/$DS/nsswitch.conf.before" ]]  &&  return # one copy is enough

cp -p /etc/nsswitch.conf  "$VAR_DIR/$DS/nsswitch.conf.before"

