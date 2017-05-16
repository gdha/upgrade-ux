# postexecute/GNU/Linux/43_restore_original_repos.sh

# We also run this during PREVIEW mode as we need the patch repos to review the updates

[[ ! -d /etc/yum.repos.d ]] && return  # not using yum.repos.d dir; perhaps Debian thingy?

if [[ -f "$VAR_DIR/$DS/yum.repos.tar" ]] ; then
    LogPrint "Restoring the original repositories"
    tar -C /etc/yum.repos.d -xvpf "$VAR_DIR/$DS/yum.repos.tar" . >&2
else
    LogPrint "**************************************************************************"
    LogPrint "WARNING: we were not able to restore the original /etc/yum.repos.d content"
    LogPrint " -> Consider restore this directory from backup"
    LogPrint "**************************************************************************"
fi
