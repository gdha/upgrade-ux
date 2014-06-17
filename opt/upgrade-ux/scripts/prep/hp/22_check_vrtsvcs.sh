# 22_check_vrtsvcs.sh
# Veritas Cluster Server software versions < 5.0 are no longer supported and we
# then advise not to patch anymore to avoid bringing the old CVS in danger

grep -q VRTSvcs "$VAR_DIR/$DS/${HOSTNAME}_swlist.before" || return  # no VCS installed

$SWLIST VRTSvcs,r\>=5.0 >/dev/null 2>&1
if (( $? > 0 )) ; then
    LogPrint "Veritas Cluster Server software has reached EOL and is not supported anymore"
    if (( PREVIEW )) ; then
	LogPrint "We strongly discourage running $PRODUCT on this system!"
    else
        Error "Due to EOL reached patching is not allowed anymore"
    fi
fi

