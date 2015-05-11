# 69_check_sendmail_poodle.sh

[[ ! -f /etc/mail/sendmail.cf ]]     && return

#cp -p /etc/mail/sendmail.cf  "$VAR_DIR/$DS/sendmail.cf"

grep -q "D{tls_version}" /etc/mail/sendmail.cf
if [[ $? -eq 0 ]]; then
    # found a possible SSLv3 may be enabled when STARTTLS is configured entry
    LogPrint "Sendmail configuration might be vulnerable against using SSLv3 with STARTTLS (CVE-2014-3566)"
    # we create an entry in DS dir; in configure section we must act upon it (if CVE-2014-3566 is found of course)
    touch "$VAR_DIR/$DS/CVE-2014-3566"
else
    Log "Sendmail configuration is not vulnerable against using SSLv3 with STARTTLS (CVE-2014-3566)"
fi
