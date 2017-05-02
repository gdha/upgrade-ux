# 36_check_virusscanner_linuxshield.sh
rpm -q MFEcma
if (( $? == 0 )) ; then
    LogPrint "Linux Shield is installed (is not allowed anymore)"

    if (( PREVIEW )) ; then
        Log "Please remove Linux Shield (package MFEcma)"
    else
        Error "Please remove Linux Shield (package MFEcma)"
    fi
fi

