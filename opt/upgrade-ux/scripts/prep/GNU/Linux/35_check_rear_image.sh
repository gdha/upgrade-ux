# 35_check_rear_image.sh script will try to find out if a RELAX-AND-RECOVER image was made before the upgrade
if [[ ! -d /var/log/rear ]]; then
    LogPrint "WARNING: please install disaster recovery software before patching e.g. Relax-and-Recover (rear)"
fi

if [[ ! -f /var/log/rear/rear-$HOSTNAME.log ]]; then
    LogPrint "WARNING: please create a disaster recovery image before patching with e.g. Relax-and-Recover (rear)"
else
    Log "Version installed of $(rear -V)"
    Log "Saving /var/log/rear/rear-$HOSTNAME.log"
    cp -p /var/log/rear/rear-$HOSTNAME.log  "$VAR_DIR/$DS/rear-$HOSTNAME.log"
fi
