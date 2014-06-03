# 26_check_bootconf.sh
# inspect the /stand/bootconf file and verify that the boot-disk matches

a=$(setboot | grep Primary | awk '{ print $4 }' | sed -e 's#/#\\/#g')
[[ -z "$a" ]] && Error "setboot does not have a Primary disk!"

case "$OS_VERSION" in
    11.11|11.23)
        grep $(ioscan -kfnC disk |  awk 'c&&!--c;/'$a'/{c=1}' | awk '{print $1}') /stand/bootconf > $TMP_DIR/bootdisk
        ;;

    11.31)
        grep $(ioscan -km lun |  awk 'c&&!--c;/'$a'/{c=1}' | awk '{print $1}') /stand/bootconf > $TMP_DIR/bootdisk
        ;;

    *)
        LogPrint "HP-UX $OS_RELEASE might not be supported by $PRODUCT"
        ;;
esac

set -A BootableDisks $( /usr/sbin/lvlnboot -v | grep "Boot Disk" | awk '{print $1}' )

if [[ ! -s $TMP_DIR/bootdisk ]]; then
    LogPrint "The /stand/bootconf file is missing and should contain"
    for disk in $(echo ${BootableDisks[@]})
    do
        LogPrint "  l  $disk"
    done
    EnterNextStageAllowed="N"
fi

if [[ ! -f /stand/bootconf ]]; then
    LogPrint "ERROR: Critical file /stand/bootconf missing"
else
    countbdsk=${#BootableDisks[@]}
    countbcfg=$(wc -l /stand/bootconf 2>/dev/null | awk '{print $1}')
    [[ -z "$countbcfg" ]] && countbcfg=0

    if (( $countbdsk != $countbcfg )) ; then
        LogPrint "The primary bootpath does not match the entry in /stand/bootconf"
        for disk in $(echo ${BootableDisks[@]})
        do
            grep -q $disk /stand/bootconf
	    if [[ $? -ne 0 ]]; then
                LogPrint "The /stand/bootconf file is missing the following line"
	        LogPrint "  l  $disk"
    	    fi
        done
        EnterNextStageAllowed="N"
    fi
fi
