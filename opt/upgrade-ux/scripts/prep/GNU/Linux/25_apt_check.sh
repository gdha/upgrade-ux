# 25_apt_check.sh
# Simple check to see if apt -v returns 0 as exit code
# If not, then we have an major issue and we should not continue until we fix it

if [[ "$OS_MASTER_VENDOR" == "debian" ]] ; then
   Log "Running $ATP -v"
   $APT -v
   rc=$?
   if [[ $rc -ne 0 ]] ; then
      Error "$APT had a major issue. Please fix it first!"
   fi
fi
