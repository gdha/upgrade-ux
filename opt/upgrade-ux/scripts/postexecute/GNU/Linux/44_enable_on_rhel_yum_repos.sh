# 44_enable_on_rhel_yum_repos.sh
# The purpose of this script to to enable all non RedHat related YUM repositories.
# Why? Most likely these were disabled by another script (outside upgrade-ux) which
# installed the new patch repo's and in the meantime disabled all present repo's.
# Heaven knows why....

[[ ! -d /etc/yum.repos.d ]]  &&  return  # no YUM repository directory present

ls /etc/yum.repos.d/*.repo | grep -v -i -E '(rhel|redhat|testing)' | cut -d/ -f4 | while read repofile
do
    # input will look like:
    # epel.repo
    # gtsc.repo
    repo=${repofile%.*}   # cut off .repo from string
    Log "Enable non-RedHat related repository $repo"
    if has_binary yum-config-manager ; then
        yum-config-manager --enable $repo >&2
    else
        sed -i -e "s|^enabled=*|enabled=1|" /etc/yum.repos.d/$repofile
    fi
done
