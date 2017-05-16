# 70_check_openssl_logjam.sh
# Script should work on all kind of UNIX flavours

# list up all httpd related config files (apache, tomcat, hp smh, ....)
# using option -xdev to avoid NAS filer search
find /usr -xdev -name "http*.conf" | grep -vE '(man|grep)' >  $TMP_DIR/list_httpd_conf_files.txt
find /opt -xdev -name "http*.conf" | grep -vE '(man|grep)' >> $TMP_DIR/list_httpd_conf_files.txt
[[ ! -s $TMP_DIR/list_httpd_conf_files.txt ]] && return   # no httpd.conf found = not vulnerable

# list up http conf files containing the keyword "SSLCipherSuite"
for FILE in $(cat $TMP_DIR/list_httpd_conf_files.txt)
do
    [[ ! -f "$FILE" ]] && continue  # to be sure we are dealing with a file
    if grep -q "SSLCipherSuite" "$FILE" ; then
        echo "$FILE" >> $TMP_DIR/list_httpd_conf_files_containing_SSLCipherSuite_keyword
    fi
done

# if the $TMP_DIR/list_httpd_conf_files_containing_SSLCipherSuite_keyword is empty = nothing to do anymore
[[ ! -s $TMP_DIR/list_httpd_conf_files_containing_SSLCipherSuite_keyword ]] && return

# if we find argument +EXP as an option with keyword SSLCipherSuite then we are vulnerable
for FILE in $(cat $TMP_DIR/list_httpd_conf_files_containing_SSLCipherSuite_keyword)
do
    grep "SSLCipherSuite" "$FILE" | grep -v "^#SSLCipherSuite" | grep -q "+EXP"
    if [[ $? -eq 0 ]]; then
        LogPrint "File $FILE is vulnerable with the OpenSSL LogJam (CVE-2015-4000) issue" 
        # keep this in VAR_DIR as we need this file again in the configure phase
        echo "$FILE" >> $VAR_DIR/$DS/OpenSSL_LogJam_EXP_vulnerable_httpd_conf_files
	# we create a empty file CVE-2015-4000 as a mark-point during the configure phase
	# to fix this
	touch  "$VAR_DIR/$DS/CVE-2015-4000"
    else
        Log "File $FILE is \"not\" vulnerable with the OpenSSL LogJam (CVE-2015-4000)"
    fi
done
