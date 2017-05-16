# prep/GNU/Linux/40_disabling_local_repos_with_satellite.sh

# We first check if this system has a valid Salellite Subscription
# Obviously, this will only be true for RHEL based systems

registration_satellite="NO"

[[ ! -x /sbin/rhn-channel ]] &&  return  # if this executable is not found we may assume no RH Satellite in picture

Log "Are there RedHat Satellite Channel(s) available?"
/sbin/rhn-channel --list >&2 && registration_satellite="YES"

#if [[ "$registration_satellite" = "YES" ]] ; then
#      for repo in $(ls /etc/yum.repos.d/*.repo) ; do
#          if (( PREVIEW )) ; then
#              Log "Move ${repo} to ${repo##*/}.$DS [not in preview mode]"
#          else
#              Log "Move ${repo} to ${repo##*/}.$DS"
#              mv -f ${repo} ${repo}.$DS
#          fi
#      done
#fi

# We will take another approach: tar all repos to VAR_DIR/DS and disable rhn during patching
# After patching we will restore everything to its original state
