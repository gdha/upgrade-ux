# 15_check_hp_vpar.sh
#####################
# check if HP vPar is running on this host, and if yes, if version is > 04.04
# define variable HP_VM_MODE

if [[ ! -f /sbin/vecheck ]] ; then
    HP_VM_MODE=npar
    return  # no vpar sw available
else
    /sbin/vecheck
    if (( $? == 0 )) ; then
        Log "vecheck(1m) confirms server IS running in virtual partition (vPars) environment"
	HP_VM_MODE=vpar
    else
        Log "vecheck(1m) confirms server NOT running in virtual partition (vPars) environment"
	HP_VM_MODE=npar
	return  # vpar sw version - we do not care - return
    fi
fi

$SWLIST T1335[ABD]C,r\>=A.04.04.04 >/dev/null  2>&1
if (( $? == 0 )) ; then
    Log "vPar software version is >=A.04.04.04, so there is no need to go into nPar mode"
else
    LogPrint "Virtual Partition [vPar] software installed, but version is < A.04.04.04"
    LogPrint "Reboot into nPar mode (# vparenv -m nPar) or (MON> reboot nPars)"
    if (( PREVIEW )) ; then
        LogPrint "[preview mode] we continue"
    else
        Error "First reboot in nPar mode and then restart $PRODUCT"
    fi
fi
