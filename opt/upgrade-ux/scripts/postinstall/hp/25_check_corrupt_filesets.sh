# 25_check_corrupt_filesets.sh
# verify if there are no corrupt filesets; if yes then we may not continue (first fix these)
$SWLIST -l fileset -a state 2>/dev/null | grep -q 'corrupt'
if (( $? == 0 )) ; then
    LogPrint "Corrupt filesets were found - remove and re-install these filesets"
    $SWLIST -l fileset -a state 2>/dev/null | grep 'corrupt' 
    $SWLIST -l fileset -a state 2>/dev/null | grep 'corrupt' >&2

    if (( PREVIEW )) ; then
        Log "Please correct above mentioned filesets before re-running $PRODUCT"
    else
        LogPrint "ERROR: Please correct above mentioned filesets before bringing system back into production."
    fi
else
    Log "No \"corrupt\" filesets were found [ok]"
fi
