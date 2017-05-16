# prep/GNU/Linux/42_archive_yum_repos_dir.sh

[[ ! -d /etc/yum.repos.d ]] && return  # not using yum.repos.d dir; perhaps Debian thingy?

[[ -f "$VAR_DIR/$DS/yum.repos.tar" ]] && return # we already have it

cd /etc/yum.repos.d
LogPrint "Archiving the repositories"
tar cvpf "$VAR_DIR/$DS/yum.repos.tar" . >&2
cd - >/dev/null
