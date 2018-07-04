# 37_sshd_config_old_kex_fix.sh

[[ ! -f /opt/ssh/etc/sshd_config ]]  &&  return   # no sshd_config found on the place we expected

[[ "$OS_VERSION" != "11.31" ]]       && return    # is only meant for HP-UX 11.31

# We should only execute this script when SecureShell supports the "+" with KexAlgorithms (release >A.07.30)
# Next line will check the current version and return silently if lower then A.07.30
$SWLIST SecureShell,r\<A.07.30 >/dev/null 2>&1 && return

[[ ! -f "$VAR_DIR/$DS/sshd_config.before" ]] && cp /opt/ssh/etc/sshd_config "$VAR_DIR/$DS/sshd_config.before"

## Unable to negotiate with 10.140.63.34 port 50888: no matching key exchange method found. Their offer: diffie-hellman-group1-sha1,diffie-hellman-group-exchange-sha1
## We should add older KEX
## #-> ssh -Q kex
## diffie-hellman-group1-sha1
## diffie-hellman-group14-sha1
## diffie-hellman-group14-sha256
## diffie-hellman-group16-sha512
## diffie-hellman-group18-sha512
## diffie-hellman-group-exchange-sha1
## diffie-hellman-group-exchange-sha256
## ecdh-sha2-nistp256
## ecdh-sha2-nistp384
## ecdh-sha2-nistp521
## curve25519-sha256@libssh.org

grep -q "^KexAlgorithms +diffie-hellman-group1-sha1," "$VAR_DIR/$DS/sshd_config.before"
if (( $? != 0 )) ; then
    # KexAlgorithms line was not found in sshd_config file
    if (( PREVIEW )) ; then
        LogPrint "Older Secure Shell KexAlgorithms need to be added in sshd_config [not in preview mode]"
    else
        # we must add the older KexAlgorithms
        # We might already have modified "$VAR_DIR/$DS/sshd_config.after" so do not blindly overwrite it
        [[ ! -f "$VAR_DIR/$DS/sshd_config.after" ]] && cp "$VAR_DIR/$DS/sshd_config.before" "$VAR_DIR/$DS/sshd_config.after"
        cat >> "$VAR_DIR/$DS/sshd_config.after" <<EOD
KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1
EOD
        cp "$VAR_DIR/$DS/sshd_config.after" /opt/ssh/etc/sshd_config
        chmod 444 /opt/ssh/etc/sshd_config
        LogPrint "Added older KexAlgorithms to /opt/ssh/etc/sshd_config file"
    fi  # end of PREVIEW
fi

