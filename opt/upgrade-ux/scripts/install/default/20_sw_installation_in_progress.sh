# 20_sw_installation_in_progress.sh
#
# purpose is to track where we are if we need to reboot and we restart $PRODUCT again
# according the rc code we might decide to continue with next stage or bail out

if (( PREVIEW )) ; then
    # in preview mode we don't care as nothing gets installed anyway (rm file)
    [[ -f $VAR_DIR/$DS/sw_installation_in_progress ]] && rm -f $VAR_DIR/$DS/sw_installation_in_progress
else
    # if $VAR_DIR/$DS/sw_installation_in_progress does not exist then we did not install sw yet
    # otherwise, count and check the lines and compare with the bundles[@]
    if [[ -f $VAR_DIR/$DS/sw_installation_in_progress ]]; then
	# file sw_installation_in_progress get created by 30_sw_install.sh so we may assume we restarted
	# $PRODUCT after a reboot and the CURRENT_STATUS is still "install:start" as 99_update_status.sh was not reached
	# at the moment we rebooted the system
        count=${#bundle[@]}    # items to install
        count_sw_installed=$( wc -l $VAR_DIR/$DS/sw_installation_in_progress | awk '{print $1}' )
        if [[ $count -eq $count_sw_installed ]]; then
            CURRENT_STATUS="$stage:ended"
	    SetCurrentStatus "$STATUS_FILE"  # and write it into status file
        fi
    fi
fi
