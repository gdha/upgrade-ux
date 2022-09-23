# 36_check_virusscanner_linuxshield.sh
Log "Check if Linux Shield virusscanner is present (it should not be the case):"
if test $RPM ; then
    $RPM -q MFEcma >&2
    if (( $? == 0 )) ; then
        LogPrint "Linux Shield is installed (is not allowed anymore)"

        if (( PREVIEW )) ; then
            Log "Please remove Linux Shield (package MFEcma)"
        else
            Error "Please remove Linux Shield (package MFEcma)"
        fi
    fi
fi
