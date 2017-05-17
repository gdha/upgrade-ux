# prep/default/05_reboot_required.sh
# If the uptime of the system is higher then 30 days then we propose to reboot first

# pre-define daysup as 0 (we can check this variable later [after a reboot])
daysup=0

# when uptime is not expressed in days then we probably just rebooted our system
uptime | grep -q days || return

daysup=$( uptime | awk '{print $3}' )
IsDigit $daysup || daysup=$( w | head -1 | awk '{print $3}' )  # alternative method
IsDigit $daysup || daysup=0

if (( daysup > DAYSUPTIME )) ; then
    if (( PREVIEW )) ; then
        LogPrint "Uptime of system is $daysup (>$DAYSUPTIME days) - recommend to reboot before patching"
    else
        # unless we used the "-F" force flag we quit
        (( FORCED )) || Error "Uptime of system is $daysup (>$DAYSUPTIME days) - reboot is required before patching with $PRODUCT"
    fi
fi
