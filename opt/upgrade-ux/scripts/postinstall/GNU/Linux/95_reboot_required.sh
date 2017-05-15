# postinstall/GNU/Linux/95_reboot_required.sh
# Check it file $VAR_DIR/$DS/reboot-required exists? Yes schedule an automatic reboot

if [[ -f "$VAR_DIR/$DS/reboot-required" ]] ; then
    if (( PREVIEW )) ; then
        # do not reboot in preview mode
        LogPrint "Kernel was updated and a reboot is required [not in preview mode]"
    else
        # variable REBOOT_INTR_TIMER syntax "+m" referring to the specified number of minutes m from now
        shutdown -r +$REBOOT_INTR_TIMER "System reboot is required.  To cancel use shutdown -c.  But don't because this system needs to be rebooted"
    fi
fi
