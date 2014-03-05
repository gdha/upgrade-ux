# dump-workflow.sh
#
WORKFLOW_dump_DESCRIPTION="dump configuration and system information"
set -A WORKFLOWS ${WORKFLOWS[@]} "dump"

function WORKFLOW_dump  {
    LogPrint "Dumping out configuration and system information"

    if [ "$ARCH" != "$REAL_ARCH" ] ; then
        LogPrint "This is a '$REAL_ARCH' system, compatible with '$ARCH'."
    fi

    LogPrint "System definition:"
    for var in "ARCH" "OS" \
        "OS_MASTER_VENDOR" "OS_MASTER_VERSION" "OS_MASTER_VENDOR_ARCH" "OS_MASTER_VENDOR_VERSION" "OS_MASTER_VENDOR_VERSION_ARCH" \
        "OS_VENDOR" "OS_VERSION" "OS_VENDOR_ARCH" "OS_VENDOR_VERSION" "OS_VENDOR_VERSION_ARCH"; do
        LogPrint "$( printf "%40s = %s" "$var" "$(show_var $var)" )"
    done

    LogPrint "Configuration tree:"
    for config in "$ARCH" "$OS" \
        "$OS_MASTER_VENDOR" "$OS_MASTER_VENDOR_ARCH" "$OS_MASTER_VENDOR_VERSION" "$OS_MASTER_VENDOR_VERSION_ARCH" \
        "$OS_VENDOR" "$OS_VENDOR_ARCH" "$OS_VENDOR_VERSION" "$OS_VENDOR_VERSION_ARCH"; do
        if [ "$config" ] ; then
            LogPrint "$( printf "%40s : %s" "$config".conf "$(
                                    test -s $ETC_DIR/"$config".conf && echo OK || echo missing/empty
                                    )" )"
        fi
    done
    for config in site local ; do
        LogPrint "$( printf "%40s : %s" "$config".conf "$(
                                test -s $ETC_DIR/"$config".conf && echo OK || echo missing/empty
                                )" )"
    done

}
