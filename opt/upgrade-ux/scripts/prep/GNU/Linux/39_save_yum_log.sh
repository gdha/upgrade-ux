# 39_save_yum_log.sh
# Keep a copy of the latest yum.log file

[[ -f "$VAR_DIR/$DS/yum.log.before" ]] && return  # if we have the yum.log file then there is no need to copy it again
cp  /var/log/yum.log "$VAR_DIR/$DS/yum.log.before"
