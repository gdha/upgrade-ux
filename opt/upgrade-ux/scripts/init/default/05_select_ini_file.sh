# 05_select_ini_file.sh
# select the proper INI file for this OS - the $ETC_DIR/$OS-$OS_VERSION.ini file
if [[ -z "$INI_FILE" ]]; then
    case "$OS" in
        "HP-UX"|"SunOS") INI_FILE="${ETC_DIR}/${OS}-${OS_VERSION}-${YEAR}.ini" ;;
        "GNU/Linux")     INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}-${YEAR}.ini" ;;
        *)               INI_FILE="${ETC_DIR}/${OS}-${OS_VENDOR}-${OS_VERSION}.ini" ;;
    esac
fi
if [[ -f $INI_FILE ]]; then
    Log "Found ini file $INI_FILE"
else
    Error "Missing ini file $INI_FILE"
fi
