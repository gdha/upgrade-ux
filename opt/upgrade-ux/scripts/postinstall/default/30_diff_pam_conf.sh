# 30_diff_pam_conf.sh
# diff copy of $VAR_DIR/$DS/pam.conf file with original (if found)
[[ ! -f /etc/pam.conf ]] && return

if [[ ! -f "$VAR_TMP/$DS/pam.conf" ]]; then
    cmp -s /etc/pam.conf "$VAR_TMP/$DS/pam.conf"
    if [[ $? -eq 1 ]]; then
	LogPrint "The /etc/pam.conf has been modified (see log file)"
        sdiff -s /etc/pam.conf "$VAR_TMP/$DS/pam.conf" >&2
    else
        Log "The /etc/pam.conf has not been modified [ok]"
    fi
fi
