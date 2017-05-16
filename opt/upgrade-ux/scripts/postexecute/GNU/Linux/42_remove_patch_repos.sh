# postexecute/GNU/Linux/42_remove_patch_repos.sh

# we have already saved a copy of all repos in "$VAR_DIR/$DS/yum.repos.tar"
# We will first remove the temporary patch repositories before we restore the
# original yum repositories again

[[ ! -d /etc/yum.repos.d ]] && return  # no /etc/yum.repos.d directory present

# We also do this in PREVIEW mode as we tested these during the 'yum check-updates'
cd /etc/yum.repos.d
LogPrint "Removing the patch repositories (used by upgrade-ux)"
rm -f $v *.repo
