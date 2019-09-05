# 32_check_vxfs_fstyp.sh
# See also https://github.com/gdha/upgrade-ux/issues/114
# The purpose is to check with VxFS file systems the fstyp and verify if we need to upgrade the
# type to 7 (which is a safe choice) for all versions of VxFS Base v4, v5, v6
# E.g. fstyp=4 is not supported on VxFS Base v6
# All HP-UX 11.31 systems have as minimum Base-VxFS-51.
#################################################################################################
# Be careful: File system / and /stand may never be upgraded as otherwise the system would become
# ----------  un-bootable!!!
#################################################################################################


# /dev/vg00/lvol3 on / type vxfs
# /dev/vg00/lvol1 on /stand type vxfs
mount -v | grep vxfs | grep -v -E '(lvol1 |lvol3)' | while read VG junk MNTPT junk
do
    FSTYP=$(fstyp -v $VG | grep version | awk '{print $2'})
    case $FSTYP in
        1|2|3) LogPrint "ERROR: Volume group $VG has fstyp=$FSTYP which is unsupported by Base-VxFS v5 and higher!" ;;
        4) LogPrint "ERROR: Volume group $VG has fstyp=$FSTYP which must be upgraded before patching."
           LogPrint "To upgrade run \"vxupgrade -n 5 $MNTPT\" followed by"
           LogPrint "\"vxupgrade -n 6 $MNTPT\" and  \"vxupgrade -n 7 $MNTPT\"" ;;
        5) LogPrint "WARNING: Volume group $VG has fstyp=$FSTYP which would be nice to upgrade to 7."
           Log "To upgrade run \"vxupgrade -n 6 $MNTPT\" and  \"vxupgrade -n 7 $MNTPT\"" ;;
        6) Log "INFO:  Volume group $VG has fstyp=$FSTYP which may be upgraded to 7."
           Log "To upgrade run  \"vxupgrade -n 7 $MNTPT\"" ;;
        *) Log "INFO: Volume group $VG has fstyp=$FSTYP which is OK."
    esac
done
