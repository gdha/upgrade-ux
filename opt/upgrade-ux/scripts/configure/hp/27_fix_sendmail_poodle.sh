# 27_fix_sendmail_poodle.sh
# in prep/hp/69_check_sendmail_poodle.sh we checked if sendmail.cf was vulnerable against CVE-2014-3566
# if we find $DS/CVE-2014-3566 file then we must fix the sendmail.cf file
[[ ! -f "$VAR_DIR/$DS/CVE-2014-3566" ]] && return

# See URL https://h20564.www2.hp.com/hpsc/doc/public/display?docId=emr_na-c04506802
# for more details about the issue

sed -e 's/^D{tls_version}.*/D{tls_version}TLSv1/' < "$VAR_DIR/$DS/sendmail.cf" > "$VAR_DIR/$DS/sendmail.cf.new"

if (( PREVIEW )) ; then
    LogPrint "Fixed the Poodle issue in sendmail.cf (CVE-2014-3566) [not in preview mode]"
else
    LogPrint "Fixed the Poodle issue in sendmail.cf (CVE-2014-3566)"
    # make a safe copy of the original configuration file
    Log "Saved copy of original sendmail configuration as /etc/mail/sendmail.cf.$DS"
    cp /etc/mail/sendmail.cf "/etc/mail/sendmail.cf.$DS"
    cp "$VAR_DIR/$DS/sendmail.cf.new" /etc/mail/sendmail.cf
    chmod 444 /etc/mail/sendmail.cf
    chown bin:bin /etc/mail/sendmail.cf
fi
