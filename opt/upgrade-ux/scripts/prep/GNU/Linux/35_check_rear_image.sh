# 35_check_rear_image.sh script will try to find out if a RELAX-AND-RECOVER image was made before the upgrade

# We will try to figure out if this system needs ReaR at all as AWS, GCP and Azure do not require it
if test $DMIDECODE ; then
    system_product=$($DMIDECODE -s system-product-name)
    case $system_product in
        ("Google Compute Engine") return ;; # Google
        ("Virtual Machine") return ;; #Azure
        ("HVM domU") return ;; # AWS RHEL/CentOS 7
        ("*.*") return ;; # all kind of AWS types
    esac
fi

if [[ ! -d /var/log/rear ]]; then
    LogPrint "WARNING: please install disaster recovery software before patching e.g. Relax-and-Recover (rear)"
    return
fi

if [[ ! -f /var/log/rear/rear-$HOSTNAME.log ]]; then
    LogPrint "WARNING: please run Relax-and-Recover (rear) before patching!"
else
    Log "Version installed of $(rear -V)"
    Log "Saving /var/log/rear/rear-$HOSTNAME.log"
    cp -p /var/log/rear/rear-$HOSTNAME.log  "$VAR_DIR/$DS/rear-$HOSTNAME.log"
    Log "Last time ReaR ran: $(stat --format=%y $VAR_DIR/$DS/rear-$HOSTNAME.log)"
fi
