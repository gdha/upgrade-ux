# 25_yum_dnf_check.sh
# Simple check to see if yum or dnf check returns 0 as exit code
# If not, then we have an major issue and we should not continue until we fix it

if [[ "$OS_VENDOR" == "rhel" ]] ; then
   if (( $OS_VERSION >= 8 )) ; then
      # We use DNF
      Log "Running $DNF check"
      $DNF check
      rc=$?
   else
      # We use YUM
      Log "Running $YUM check"
      $YUM check
      rc=$?
   fi
   if [[ $rc -ne 0 ]] ; then
      Error "yum or dnf check had a major issue. Please fix it first!"
   fi
fi
