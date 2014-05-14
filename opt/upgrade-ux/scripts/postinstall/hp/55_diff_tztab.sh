# 55_diff_tztab.sh

# if we do not have both files to compare just return
[[ ! -f "$VAR_DIR/$DS/tztab.before" ]]           && return
[[ ! -f /usr/lib/tztab ]]                        && return
[[ ! -f /usr/newconfig/usr/lib/tztab ]]          && return

cmp -s /usr/newconfig/usr/lib/tztab  /usr/lib/tztab
if [[ $? -eq 1 ]]; then
    LogPrint "Timezone table was not updated by patch (due to manual updates most likely)"
    sdiff -s /usr/newconfig/usr/lib/tztab  /usr/lib/tztab >&2
    case "$OS_VERSION" in
      "11.11") LogPrint "ATTENTION: Read the special instructions of the tztab patch PHCO_42537 or PHCO_42538" ;;
      "11.23") LogPrint "ATTENTION: Read the special instructions of the tztab patch" ;;
      "11.31") LogPrint "ATTENTION: Read the special instructions of the tztab patch" ;;
      *) LogPrint "Read the special instructions of the tztab patch" ;;
    esac
fi

