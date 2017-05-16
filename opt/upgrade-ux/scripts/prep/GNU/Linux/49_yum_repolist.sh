# 07_yum_repolist.sh
#
# script to list the available repositories visible on this system

[[ -f "$VAR_DIR/$DS/yum.repolist" ]] && return

Log "Save the available repositories into yum.repolist"
$YUM repolist $v   > "$VAR_DIR/$DS/yum.repolist" 
