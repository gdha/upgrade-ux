# 26_check_autoboot.sh
# setboot | grep Autoboot
# Autoboot is ON (enabled)
setboot | grep Autoboot | grep -q ON
if [[ $? -ne 0 ]]; then
    a=$(setboot | grep Primary | awk '{ print $4 }' | sed -e 's#/#\\/#g')
    LogPrint "Autoboot is not configured properly"
    LogPrint "Use 'setboot -p $a -b on'"
    EnterNextStageAllowed="N"
fi
