# prep/GNU/Linux/40_disabling_local_repos_with_satellite.sh

# We first check if this system has a valid Salellite Subscription
# Obviously, this will only be true for RHEL based systems

registration_satellite="NO"

[[ ! -x /sbin/rhn-channel ]] &&  return  # if this executable is not found we may assume no RH Satellite in picture

/sbin/rhn-channel --list && registration_satellite="YES"

if [[ "$registration_satellite" = "YES" ]] ; then
      for repo in $(ls /etc/yum.repos.d/*.repo) ; do
          mv ${repo} ${repo}.$(date +%F.%H%M)
      done
fi
