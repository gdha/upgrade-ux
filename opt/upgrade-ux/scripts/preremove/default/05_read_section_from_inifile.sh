# 05_read_section_from_inifile.sh
# read the [$stage] section from INI_FILE

unset command
unset options
unset bundle
unset version

ParseIniFile $stage

[ "$DEBUG" ] && LogPrint "Commands are ${command[@]}"
[ "$DEBUG" ] && LogPrint "Options are ${options[@]}"
[ "$DEBUG" ] && LogPrint "Bundles are ${bundle[@]}"
[ "$DEBUG" ] && LogPrint "Versions are ${version[@]}"
