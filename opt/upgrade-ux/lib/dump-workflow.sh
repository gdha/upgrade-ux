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

    LogPrint "INI files tree:"
    # See also script scripts/init/default/05_select_ini_file.sh
    # In first instance we check if we have an ${OS_MASTER_VENDOR}.ini file:
    #  - On Debian variants the ini file is GNU/Linux-debian.ini
    #  - On RHEL variants the ini file is GNU/Linux-fedora.ini
    #  - On HP-UX the HP-UX-.ini will never exists as $OS_MASTER_VENDOR is empty
    if [[ -f "${ETC_DIR}/${OS}-${OS_MASTER_VENDOR}.ini" ]] ; then
        INI_FILE="${ETC_DIR}/${OS}-${OS_MASTER_VENDOR}.ini"
        LogPrint "$( printf "%40s : %s" "$(basename $INI_FILE)" "$( test -s "$INI_FILE" && echo OK || echo missing/empty )" )"
    fi
    case "$OS" in
        "HP-UX"|"SunOS") INI_FILE="${ETC_DIR}/${OS}-${OS_VERSION}-${YEAR}.ini" ;;
        "GNU/Linux")     INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini" ;;
        *)               INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini" ;;
    esac

    LogPrint "$( printf "%40s : %s" "$(basename $INI_FILE)" "$( test -s "$INI_FILE" && echo OK || echo missing/empty )" )"

    # However, if we find ${OS}-${OS_VENDOR}-${OS_VERSION}-${YEAR}.ini file, then this ini file overrules all
    if [[ -f "${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}-${YEAR}.ini" ]] ; then
        INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}-${YEAR}.ini"
        LogPrint "$( printf "%40s : %s" "$(basename $INI_FILE)" "$( test -s "$INI_FILE" && echo OK || echo missing/empty )" )"
    fi
}
