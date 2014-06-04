# 80_rm_sw_installation_in_progress_file.sh
# only to be run in preview mode - rename the $VAR_DIR/$DS/sw_installation_in_progress file
# otherwise we might have the wrong count during sw installation - see issue #3

if (( PREVIEW )) ; then

    if [[ -f "$VAR_DIR/$DS/sw_installation_in_progress" ]]; then
        mv "$VAR_DIR/$DS/sw_installation_in_progress" "$VAR_DIR/$DS/sw_installation_in_progress.preview"
	Log "Saved the history of software installation in $VAR_DIR/$DS/sw_installation_in_progress.preview"
    fi

fi
