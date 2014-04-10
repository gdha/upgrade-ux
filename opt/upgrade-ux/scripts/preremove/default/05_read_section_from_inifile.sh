# 05_read_section_from_inifile.sh
# read the [$stage] section from INI_FILE

unset command
unset options
unset source
unset bundle
unset version

ParseIniFile $stage

[ "$DEBUG" ] && LogPrint "Commands are ${command[@]}"
[ "$DEBUG" ] && LogPrint "Options are ${options[@]}"
[ "$DEBUG" ] && LogPrint "Source is ${source[@]}"
[ "$DEBUG" ] && LogPrint "Bundles are ${bundle[@]}"
[ "$DEBUG" ] && LogPrint "Versions are ${version[@]}"
