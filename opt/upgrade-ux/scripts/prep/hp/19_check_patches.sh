# 19_check_patches.sh
# Save the output of  check_patches as a reference

[[ ! -x /usr/contrib/bin/check_patches ]] && return

if [[ ! -f "$CHECK_PATCHES_BEFORE" ]]; then

    /usr/contrib/bin/check_patches 
    mv /tmp/check_patches.report "$CHECK_PATCHES_BEFORE"
    LogPrint "Result of check_patches saved as $CHECK_PATCHES_BEFORE"

else

    # check if previous copy had an error in it, if so, then re-run it again
    grep -q ERROR $CHECK_PATCHES_BEFORE
    if (( $? == 0 )) ; then
        /usr/contrib/bin/check_patches
	mv /tmp/check_patches.report "$CHECK_PATCHES_BEFORE"
	LogPrint "Result of check_patches saved as $CHECK_PATCHES_BEFORE"
    fi

fi

# look for ERRORS in $CHECK_PATCHES_BEFORE 
grep -q ERROR $CHECK_PATCHES_BEFORE
if (( $? == 0 )) ; then
    # seems we had erros during the check_patches - print a message
    LogPrint "Errors were detected by check_patches - look in $CHECK_PATCHES_BEFORE"
    # dump the errors in the log file (at least for now)
    grep -i error $CHECK_PATCHES_BEFORE >&2
    # show error listed in swagent.log file - use special function ShowErrorsSwagentLog
    ShowErrorsSwagentLog >&2
    (( $FORCED )) || EnterNextStageAllowed="N"
fi
