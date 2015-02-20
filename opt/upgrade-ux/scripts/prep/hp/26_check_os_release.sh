# 26_check_os_release.sh
# script added for issue #32
count=$( $SWLIST -l bundle -a os_release | grep HPUX11i | wc -l )
if (( $count > 1 )) ; then
    LogPrint "Update-UX will fail because more then 1 os_release has been found with swlist"
    Log  "Use 'swlist -l bundle -a os_release | grep HPUX11i' to review"
    Log  "The fix is described in https://github.com/gdha/upgrade-ux/issues/32"
    EnterNextStageAllowed="N"
fi

