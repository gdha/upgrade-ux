# 05_select_ini_file.sh
# Select the proper INI file for this OS - the $ETC_DIR/$OS-$OS_VERSION.ini file
# The INI_FILE is empty on this moment:
if [[ -z "$INI_FILE" ]]; then
    case "$OS" in
        "HP-UX"|"SunOS") INI_FILE="${ETC_DIR}/${OS}-${OS_VERSION}-${YEAR}.ini" ;;
        "GNU/Linux")     INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}-${YEAR}.ini" ;;
        *)               INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini" ;;
    esac
fi
# We will check in the following order, e.g. GNU/Linux-ubuntu-24-2026.ini, GNU/Linux-ubuntu-24.ini, GNU/Linux-debian.ini
if [[ -f $INI_FILE ]]; then
    Log "Found ini file $INI_FILE"
elif [[ -f "${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini" ]]; then
    INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini"
    Log "Found ini file $INI_FILE"
elif [[ -f "${ETC_DIR}/${OS}-${OS_MASTER_VENDOR}.ini" ]]; then
    INI_FILE="${ETC_DIR}/${OS}-${OS_MASTER_VENDOR}.ini"
    Log "Found ini file $INI_FILE"
else
    Error "Missing ini file $INI_FILE"
fi
