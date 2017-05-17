# prep/GNU/Linux/43_save_yum_enable_status.sh

[[ ! -d /etc/yum.repos.d ]] && return  # no /etc/yum.repos.d directory present

[[ -f "$VAR_DIR/$DS/yum.repo.enable.status" ]] && return  # once is enough

grep enabled /etc/yum.repos.d/*.repo | uniq > "$VAR_DIR/$DS/yum.repo.enable.status"
