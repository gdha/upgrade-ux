# 73_save_and_diff_sshd_config.sh

[[ ! -f "$VAR_DIR/$DS/sshd_config.before" ]] && return

# According issue #71 the /etc/opt/ssh/sshd_config is sometimes modified
# Therefore, we do the check and report if that is true

cp -p /etc/opt/ssh/sshd_config  "$VAR_DIR/$DS/sshd_config.after"

cmp -s "$VAR_DIR/$DS/sshd_config.after" "$VAR_DIR/$DS/sshd_config.before"
if (( $? == 1 )); then
    LogPrint "The /etc/opt/ssh/sshd_config seems to be modified after patching:"
    sdiff -s "$VAR_DIR/$DS/sshd_config.after" "$VAR_DIR/$DS/sshd_config.before"
    # to have the diffs in the log file as well repeat with sending to  >&2
    sdiff -s "$VAR_DIR/$DS/sshd_config.after" "$VAR_DIR/$DS/sshd_config.before"  >&2
    LogPrint "Attention! Secure Shell connection may fail - please verify ASAP"
    LogPrint "The original /etc/opt/ssh/sshd_config was saved as $VAR_DIR/$DS/sshd_config.before"
    LogPrint "******* Copy back the original sshd_config may be necessary *******"
fi

