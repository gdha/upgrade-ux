# 20_check_corrupt_filesets.sh
# verify if there are no corrupt filesets; if yes then we may not continue (first fix these)
$SWLIST -l fileset -a state | grep -q 'corrupt'
if [[ $? -eq 0 ]]; then
    LogPrint "Corrupt filesets were found - remove these and retry (see log file)"
    $SWLIST -l fileset -a state | grep 'corrupt'
fi
