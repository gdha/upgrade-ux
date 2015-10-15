# 26_fix_openssl_logjam.sh
# in prep/default/70_check_openssl_logjam.sh we checked for the OpenSSL LogJam vulnerability
# see CVE-2015-4000 : http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-4000

# if the following file does not exist then we are not vulnerable (or have no http config files)
[[ ! -f "$VAR_DIR/$DS/CVE-2015-4000" ]] && return


if (( PREVIEW )) ; then
    LogPrint "Fixed the OpenSSL LogJam vulnerability (CVE-2015-4000) [not in preview mode]"
    return
fi

[[ ! -f $VAR_DIR/$DS/OpenSSL_LogJam_EXP_vulnerable_httpd_conf_files ]] && return

Log "Fixing the OpenSSL LogJam issues (CVE-2015-4000)"
today=$(date +'%Y-%m-%d')
for FILE in $(cat $VAR_DIR/$DS/OpenSSL_LogJam_EXP_vulnerable_httpd_conf_files)
do
    cp -p "$FILE" "$FILE.$today"
    Log "Backup file $FILE.$today created"
    ed -s "$FILE" <<-EOD
	/^SSLCipherSuite/
	s/SSLCipherSuite/#SSLCipherSuite/
	t.
	s/+EXP/!EXP/
	s/#SSLCipherSuite/SSLCipherSuite/
	w
	q
	EOD
    LogPrint "Fixed the OpenSSL LogJam issue in $FILE"
done


