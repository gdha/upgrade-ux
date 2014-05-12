# 20_check_corrupt_filesets.sh
# verify if there are no corrupt filesets; if yes then we may not continue (first fix these)
$SWLIST -l fileset -a state 2>/dev/null | grep -q 'corrupt'
if [[ $? -eq 0 ]]; then
    LogPrint "Corrupt filesets were found - remove and re-install these filesets (see log file)"
    $SWLIST -l fileset -a state 2>/dev/null | grep 'corrupt' >&2
fi

if (( PREVIEW )) ; then
    Log "Please correct above mentioned filesets before re-running $PRODUCT"
else
    Error "Please correct above mentioned filesets before re-running $PRODUCT"
fi
