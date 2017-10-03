# prep/GNU/Linux/43_save_yum_enable_status.sh

[[ ! -d /etc/yum.repos.d ]] && return  # no /etc/yum.repos.d directory present

[[ -f "$VAR_DIR/$DS/yum.repo.enable.status" ]] && return  # once is enough

# We will skip this step as we do not want to modify status of the current
# repositories. Do not want to remove this script as in postexecute/GNU/Linux
# we have an opposite script 44_restore_yum_enable_status.sh (a nice one which
# we do not want to loose and which will not run if 
# $VAR_DIR/$DS/yum.repo.enable.status is not found)

#grep enabled /etc/yum.repos.d/*.repo | uniq > "$VAR_DIR/$DS/yum.repo.enable.status"
