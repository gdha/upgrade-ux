# 45_remove_original_repos.sh

# we have already saved a copy of all repos in "$VAR_DIR/$DS/yum.repos.tar"
# Now we will remove the original ones before we run 47_configure_yum_repos.sh
# to configure the patch repositories

[[ ! -d /etc/yum.repos.d ]] && return  # no /etc/yum.repos.d directory present

# We also do this in PREVIEW mode so we can test the 'yum check-updates' later on
cd /etc/yum.repos.d
LogPrint "Removing the original repositories (during upgrade-ux run)"
rm -f $v *.repo
cd - >/dev/null
