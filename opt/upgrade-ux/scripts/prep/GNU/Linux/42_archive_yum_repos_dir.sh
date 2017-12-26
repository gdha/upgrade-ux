# prep/GNU/Linux/42_archive_yum_repos_dir.sh

[[ ! -d /etc/yum.repos.d ]] && return  # not using yum.repos.d dir; perhaps zypper or ubuntu?

[[ -f "$VAR_DIR/$DS/yum_repos_before.tar" ]] && return # we already have it

cd /etc/yum.repos.d
LogPrint "Archiving the current YUM repositories (yum_repos_before.tar)"
tar cvpf "$VAR_DIR/$DS/yum_repos_before.tar" . >&2
cd - >/dev/null
