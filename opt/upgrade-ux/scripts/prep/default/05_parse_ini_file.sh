# 05_parse_ini_file.sh
# read and analyze the $ETC_DIR/$OS-$OS_VERSION.ini file
if [[ -f $ETC_DIR/${OS}-${OS_VERSION}.ini ]]; then
    Log "Found ini file $ETC_DIR/${OS}-${OS_VERSION}.ini"
else
    Error "Missing ini file $ETC_DIR/${OS}-${OS_VERSION}.ini"
fi
