# 26_check_bootconf.sh
# inspect the /stand/bootconf file and verify that the boot-disk matches

a=$(setboot | grep Primary | awk '{ print $4 }' | sed -e 's#/#\\/#g')
[[ -z "$a" ]] && Error "setboot does not have a Primary disk!"

set -A BootableDisks $( /usr/sbin/lvlnboot -v 2>/dev/null | grep "Boot Disk" | awk '{print $1}' )

if [[ ! -f /stand/bootconf ]]; then
    LogPrint "ERROR: Critical file /stand/bootconf missing and should contain:"
    for disk in $(echo ${BootableDisks[@]})
    do
        LogPrint "  l  $disk"
    done
    (( FORCED )) || EnterNextStageAllowed="N"
fi

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


if [[ ! -s $TMP_DIR/bootdisk ]]; then
    LogPrint "ERROR: The /stand/bootconf file might be missing some entries:"
    for disk in $(echo ${BootableDisks[@]})
    do
        LogPrint "  l  $disk"
    done
    (( FORCED )) || EnterNextStageAllowed="N"
fi

# investigate the boot disk(s) listed in /stand/bootconf
countbdsk=${#BootableDisks[@]}
countbcfg=$(wc -l /stand/bootconf 2>/dev/null | awk '{print $1}')
[[ -z "$countbcfg" ]] && countbcfg=0

if (( countbdsk != countbcfg )) ; then
    LogPrint "The primary bootpath does not match the entry in /stand/bootconf"
    for disk in $(echo ${BootableDisks[@]})
    do
        grep -q $disk /stand/bootconf
        if (( $? > 0 )) ; then
            LogPrint "ERROR: The /stand/bootconf file is missing the following line"
            LogPrint "  l  $disk"
        fi
    done
    (( FORCED )) || EnterNextStageAllowed="N"
fi
