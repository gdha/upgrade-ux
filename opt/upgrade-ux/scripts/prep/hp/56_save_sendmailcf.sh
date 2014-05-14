# 56_save_sendmailcf.sh

[[ ! -f /etc/mail/sendmail.cf ]]     && return
[[ -f "$VAR_DIR/$DS/sendmail.cf" ]]  && return  # we already have a copy

cp -p /etc/mail/sendmail.cf  "$VAR_DIR/$DS/sendmail.cf"
