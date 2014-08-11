# 10_save_rc_log.sh

[[ ! -f /etc/rc.log ]] && return

if (( PREVIEW )) ; then
    :
else
    cp -p /etc/rc.log  "$VAR_DIR/$DS/rc.log.after"
fi
