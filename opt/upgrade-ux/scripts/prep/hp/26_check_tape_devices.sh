# 26_check_tape_devices.sh
# verify if we have local tape device defined; postinstall script will verify 
# the existence of this file to check kernel parameter settings

case "$OS_VERSION" in
    11.11|11.23)
        ioscan -kfnC tape > $TMP_DIR/tape_devices
        ;;

    11.31)
        ioscan -kfnNC tape > $TMP_DIR/tape_devices
        ;;

	*) # OS not supported
	return
	;;
esac

if [[ ! -s $TMP_DIR/tape_devices ]]; then
    # empty file = no tape devices present
    Log "System $lhost has no local tape devices"
else
    # tape devices found, save the file for postinstall phase
    cp $TMP_DIR/tape_devices $VAR_DIR/tape_devices
fi

