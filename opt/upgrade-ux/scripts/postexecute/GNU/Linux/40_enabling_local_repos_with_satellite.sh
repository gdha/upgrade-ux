# postexecute/GNU/Linux/40_enabling_local_repos_with_satellite.sh

#if [[ "$registration_satellite" = "YES" ]] ; then
#    Log "Re-enable local yum repositories"  
#    for repo in $(ls /etc/yum.repos.d/*.repo.$DS) ; do
#        if (( PREVIEW )) ; then
#            Log "Move ${repo}.$DS to ${repo##*/} [not in preview mode]"
#        else
#            Log "Move ${repo}.$DS to ${repo##*/}"
#            mv -f ${repo}.$DS ${repo}
#        fi
#    done
#fi

# We took another approach: restore the archive repos from VAR_DIR/DS and restore systemid if present
