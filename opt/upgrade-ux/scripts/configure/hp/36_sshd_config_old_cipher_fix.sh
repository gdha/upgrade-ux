# 36_sshd_config_old_cipher_fix.sh

[[ ! -f /opt/ssh/etc/sshd_config ]]  &&  return   # no sshd_config found on the place we expected

[[ "$OS_VERSION" != "11.31" ]]       && return    # is only meant for HP-UX 11.31

[[ ! -f "$VAR_DIR/$DS/sshd_config.before" ]] && cp /opt/ssh/etc/sshd_config "$VAR_DIR/$DS/sshd_config.before"

## The sshd v7.30 has a new cipher scheme in play:
## chacha20-poly1305@openssh.com, aes128-ctr,aes192-ctr,aes256-ctr,
## aes128-gcm@openssh.com,aes256-gcm@openssh.com
## and older ssh client programs sometimes require older ciphers

grep -q "^Ciphers +aes256-ctr," "$VAR_DIR/$DS/sshd_config.before"
if (( $? != 0 )) ; then
    # Ciphers line was not found in sshd_config file
    if (( PREVIEW )) ; then
        LogPrint "Older Secure Shell Ciphers need to be added in sshd_config [not in preview mode]"
    else
        # we must add the older ciphers
        cp "$VAR_DIR/$DS/sshd_config.before" "$VAR_DIR/$DS/sshd_config.after"
        cat >> "$VAR_DIR/$DS/sshd_config.after" <<EOD
Ciphers +aes256-ctr,aes192-ctr,aes128-ctr,rijndael-cbc@lysator.liu.se,aes256-cbc,aes192-cbc,aes128-cbc,arcfour256,arcfour128,arcfour,cast128-cbc,blowfish-cbc,3des-cbc
EOD
        cp "$VAR_DIR/$DS/sshd_config.after" /opt/ssh/etc/sshd_config
        chmod 444 /opt/ssh/etc/sshd_config
        LogPrint "Added older Ciphers to /opt/ssh/etc/sshd_config file"
    fi  # end of PREVIEW
fi

