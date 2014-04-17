# 5_reboot_required.sh
# if the uptime of the system is higher then 30 days then we propose to reboot first

daysup=$( uptime | awk '{print $3}' )
IsDigit $daysup || daysup=$( w | head -1 | awk '{print $3}' )  # alternative method
IsDigit $daysup || daysup=0

if [[ $daysup -gt $DAYSUPTIME ]]; then
    if (( PREVIEW )) ; then
        LogPrint "Uptime of system is $daysup (>$DAYSUPTIME days) - recommend to reboot before patching"
    else
        Error "Uptime of system is $daysup (>$DAYSUPTIME days) - reboot is required before patching with $PRODUCT"
    fi
fi