# 19_check_patches.sh
# Save the output of  check_patches as a reference

[[ ! -x /usr/contrib/bin/check_patches ]] && return

[[ -f "$CHECK_PATCHES_BEFORE" ]] && return  # we already have the output

/usr/contrib/bin/check_patches 
mv /tmp/check_patches.report "$CHECK_PATCHES_BEFORE"
LogPrint "Result of check_patches saved as $CHECK_PATCHES_BEFORE"

# look for ERRORS in $CHECK_PATCHES_BEFORE 
grep -q ERROR $CHECK_PATCHES_BEFORE
if (( $? == 0 )) ; then
    # seems we had erros during the check_patches - print a message
    LogPrint "Errors were detected by check_patches - look in $CHECK_PATCHES_BEFORE"
    # dump the errors in the log file (at least for now)
    grep -i error $CHECK_PATCHES_BEFORE >&2
fi
