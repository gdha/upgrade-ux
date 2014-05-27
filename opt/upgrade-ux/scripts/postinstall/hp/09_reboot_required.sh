# 09_reboot_required.sh
# after installation of global patch bundle or update-ux we must reboot, but that takes 20 secs or so
# in the meantime we would already executing scripts in the postinstall phase (which should be staretd after
# the reboot). Furthermore, we want to avoid that new additional software installation gets interrupted which
# could lead to corrupt filesets, etc.. therfefore, sleep a bit?
if (( PREVIEW )) ; then
    : # in preview mode it is not required to wait
else
    # upgrade mode - we sleep a bit
    if [[ ! -f "$VAR_DIR/$DS/.rebooted" ]]; then
	# this file is created by ./08_save_shutdownlog.sh
        LogPrint "Waiting for the reboot (or to be certain) [30s] ..."
        sleep 30
    fi
fi
