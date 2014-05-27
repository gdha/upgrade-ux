# 40_inspect_mpt_settings.sh
# On systems were the ULTRA320 software is installed you will find a start-up script called /sbin/init.d/mpt
# SCSI Ultra320 A6961-60011 can only work good in ultra160 speed instead of the default ultra320
# we will inspect out configuration and throw some warnings if needed
case $OS_VERSION in
    11.31) /usr/sbin/ioscan -kfnNd mpt > "$TMP_DIR/ultra320.ioscan" ;;
	*) /usr/sbin/ioscan -kfnd  mpt > "$TMP_DIR/ultra320.ioscan" ;;
esac

[[ ! -s "$TMP_DIR/ultra320.ioscan" ]]   &&  return   # empty file - no ultra320 HBA present

[[ ! -f /usr/sbin/mptconfig ]] &&  return            # no executable present; very weird

# we are only interested in ULTRA320 HBA and more specific type A6961; merge 2 lines before grepping
for hba in $(cat "$TMP_DIR/ultra320.ioscan" | awk 'NR%2{printf $0" ";next;}1' | grep -i ultra320 | grep A6961 | awk '{print $NF}')
do
    # check if current SCSI rate is ultra320
    /usr/sbin/mptconfig $hba > "$VAR_DIR/$DS/ultra320.${hba##*/}.before"
    grep -q -i "No Targets" "$VAR_DIR/$DS/ultra320.${hba##*/}.before"
    if (( $? > 0 )) ; then
        # there are disks presents; now check speed
        grep -q -i ultra320 "$VAR_DIR/$DS/ultra320.${hba##*/}.before"
	if [[ $? -eq 0 ]]; then
            # HBA speed is ultra320 - redine to ultra160
	    LogPrint "Ultra320 device $hba SCSI rate is ultra320 - lower it to ultra160"
	    echo y | /usr/sbin/mptconfig -r ultra160 $hba >&2
	    cp -p /sbin/init.d/mpt "$VAR_DIR/$DS/mpt.before"
	fi
    fi
done

if [[ -f "$VAR_DIR/$DS/mpt.before" ]]; then
    grep class_device "$VAR_DIR/$DS/mpt.before" | grep -q A6491A
    if [[ $? -eq 0 ]]; then
        # startup script was not yet adapted to lower the speed to ultra160 (contains still the old card types)
        sed -e 's/A6491A/A6961/g' < "$VAR_DIR/$DS/mpt.before" > "$VAR_DIR/$DS/mpt.after"
	if (( PREVIEW )) ; then
	    LogPrint "Modified /sbin/init.d/mpt to lower speed of A6961 cards to ultra160 [not in preview mode]"
        else
	    cp "$VAR_DIR/$DS/mpt.after" /sbin/init.d/mpt
	    chmod 555 /sbin/init.d/mpt
	    LogPrint "Modified /sbin/init.d/mpt to lower speed of A6961 cards to ultra160"
	fi
	Log "Original start-up file is saved as $VAR_DIR/$DS/mpt.before"
    fi
fi

for hba in $(cat "$TMP_DIR/ultra320.ioscan" | awk 'NR%2{printf $0" ";next;}1' | grep -i ultra320 | grep A6961 | awk '{print $NF}')
do
    # in case we need evidence to proof it was changed we go over the list once more
    /usr/sbin/mptconfig $hba > "$VAR_DIR/$DS/ultra320.${hba##*/}.after"
done
Log "Check the speed modification within the files $VAR_DIR/$DS/ultra320.mpt* [before|after]"
