# 73_save_netdaemons.sh

if [[ ! -f /etc/rc.config.d/netdaemons ]] ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: /etc/rc.config.d/netdaemons is missing (how is it possible that this system even booted?)"
        return
    else
        Error "/etc/rc.config.d/netdaemons is missing (how is it possible that this system even booted?)"
    fi
fi

[[ -f "$VAR_DIR/$DS/netdaemons.before" ]]  &&  return # one copy is enough

cp -p /etc/rc.config.d/netdaemons  "$VAR_DIR/$DS/netdaemons.before"

