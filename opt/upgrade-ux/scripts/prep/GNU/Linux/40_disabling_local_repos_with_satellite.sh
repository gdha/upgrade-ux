# prep/GNU/Linux/40_disabling_local_repos_with_satellite.sh

# We first check if this system has a valid Salellite Subscription
# Obviously, this will only be true for RHEL based systems
if (( rhn_satellite_subscription )) ; then

    Log "Are there RedHat Satellite Channel(s) available?"
    /sbin/rhn-channel --list >&2

#      for repo in $(ls /etc/yum.repos.d/*.repo) ; do
#          if (( PREVIEW )) ; then
#              Log "Move ${repo} to ${repo##*/}.$DS [not in preview mode]"
#          else
#              Log "Move ${repo} to ${repo##*/}.$DS"
#              mv -f ${repo} ${repo}.$DS
#          fi
#      done
fi

# If rhn-channel is in use then we should do not foresee anything special
# as the channels will take care of it
