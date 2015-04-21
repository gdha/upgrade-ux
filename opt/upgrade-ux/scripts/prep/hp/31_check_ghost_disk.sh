# 31_check_ghost_disk.sh
# when we detect a ghost disk we print an alert or abort (in upgrade mode)

rc=0
for lv in $( /usr/sbin/vgdisplay -v 2>/dev/null| awk '/LV Name/ {print $3}' )
do
    i=$( /usr/sbin/lvdisplay -v $lv | grep '?' | wc -l )
    if (( i > 0 )) ; then
        rc=$(( rc + 1 ))
	LogPrint "ERROR: Ghost disk found in lvol $lv"
        LogPrint "To find the ghost disk use command: /usr/sbin/lvdisplay -v $lv"
    fi
done

if (( rc != 0 )) ; then
    if (( PREVIEW )) ; then
	LogPrint "ERROR: please replace the broken disk first (ghost lvols found)"
    else
        # upgrade mode
	if  (( FORCED )) ; then
            LogPrint "ERROR: please replace the broken disk first (ghost lvols found)"
            LogPrint "*****  Continue on your own risk (Force flag detected) *****"
        else
            Error "Please replace the broken disk first (ghost lvols found)"
        fi
    fi
fi

