# prep/GNU/Linux/55_verify_rpm_packages.sh
# Reason why - see https://people.redhat.com/berrange/notes/rpmrecovery.html
[[ ! -d /var/lib/rpm ]] &&  return  # no RPM directory - no verification required
[[ ! -x /usr/lib/rpm/rpmdb_verify ]] && return  # if we do not have the required executable just return

cd /var/lib/rpm
Log "Verify RPM Packages integrity:"
/usr/lib/rpm/rpmdb_verify Packages >&2
if (( $? > 0 )) ; then
    LogPrint "ERROR: RPM Packages verification failed - see https://people.redhat.com/berrange/notes/rpmrecovery.html"
fi
cd -
