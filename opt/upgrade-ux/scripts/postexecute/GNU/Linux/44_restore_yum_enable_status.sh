# postexecute/GNU/Linux/44_restore_yum_enable_status.sh

[[ ! -d /etc/yum.repos.d ]] && return  # no /etc/yum.repos.d directory present

[[ ! -f "$VAR_DIR/$DS/yum.repo.enable.status" ]] && return  # no file to work with

OIFS=$IFS
IFS=":"
while read repofile enabled ; do
    if [[ "$enabled" == "enabled=1" ]] ; then
        # original this $repofile was in an enabled state; therefore, we enable it again
        # just to be sure
        repo=$( basename $repofile ) # remove the path from the name
        repo=${repo%.*}   # cut off .repo from string
        Log "(re-)Enable repository $repo"
        if has_binary yum-config-manager ; then
            yum-config-manager --enable $repo >&2
        else
            sed -i -e "s|^enabled=*|enabled=1|" $repofile
        fi
    fi
done < "$VAR_DIR/$DS/yum.repo.enable.status"
IFS=$OIFS
