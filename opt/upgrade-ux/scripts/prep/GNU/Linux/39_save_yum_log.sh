# 39_save_yum_log.sh
# Keep a copy of the latest yum.log file

if [[ -f /var/log/yum.log ]] ; then
   [[ -f "$VAR_DIR/$DS/yum.log.before" ]] && return  # if we have the yum.log file then there is no need to copy it again
   cp /var/log/yum.log "$VAR_DIR/$DS/yum.log.before"
fi

if [[ -f /var/log/dnf.log ]] ; then
   [[ -f "$VAR_DIR/$DS/dnf.log.before" ]] && return  # if we have the dnf.log file then there is no need to copy it again
   cp /var/log/dnf.log "$VAR_DIR/$DS/dnf.log.before"
fi
