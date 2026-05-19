# Script 90_remove_mitigation_CopyFail.sh

function remove_copyfail_mitigation {
    # When the default kernel entry does not contain algif_aead_init argument just return
    /usr/sbin/grubby --info=0 | grep args | grep -q algif_aead_init || return
    # Remove the kernel parameter from all entries:
    LogPrint "Remove CopyFail mitigation initcall_blacklist=algif_aead_init from the kernel arguments list"
    /usr/sbin/grubby --update-kernel=ALL --remove-args="initcall_blacklist=algif_aead_init"  >&2
}

if (( PREVIEW )) ; then
    : # do nothing and say nothing
else
    # Before removing the mitigation we need to verify kernel versions
    CURRENT_KERNEL_VERSION="$(uname -r)"
    CURRENT_KERNEL_VERSION="${CURRENT_KERNEL_VERSION%.x86_64}"
    # Grab the kernel version that will be installed (will only work on RHEL based OSes)
    INSTALLED_KERNEL_VERSION="$(grep 'Package kernel.x86' $LOGFILE 2>/dev/null| grep installed  | awk '{print $6}' | sort -u)"
    [[ -z "$INSTALLED_KERNEL_VERSION" ]] && return

    case "$OS_VENDOR_VERSION" in
       ("rhel/8")
           REQUIRED_KERNEL_VERSION="4.18.0-553.123.1.el8_10"
           ;;
       ("rhel/9")
           REQUIRED_KERNEL_VERSION="5.14.0-611.54.1.el9_7"
           ;;
       ("rhel/10")
           REQUIRED_KERNEL_VERSION="6.12.0-124.55.1.el10_1"
           ;;
       (*)
           return
           ;;
    esac
    # Now we can compare the kernels
    if [[ "$(printf '%s\n%s' "$REQUIRED_KERNEL_VERSION" "$CURRENT_KERNEL_VERSION" | sort -V | head -n1)" = "$REQUIRED_KERNEL_VERSION" ]]; then
        Log "Current kernel ($CURRENT_KERNEL_VERSION) is higher than or equal to $REQUIRED_KERNEL_VERSION"
        remove_copyfail_mitigation
        return
    else
        Log "Current kernel ($CURRENT_KERNEL_VERSION) is lower than $REQUIRED_KERNEL_VERSION"
    fi
    if [[ "$(printf '%s\n%s' "$REQUIRED_KERNEL_VERSION" "$INSTALLED_KERNEL_VERSION" | sort -V | head -n1)" = "$REQUIRED_KERNEL_VERSION" ]]; then
        Log "Installed kernel ($INSTALLED_KERNEL_VERSION) is higher than or equal to $REQUIRED_KERNEL_VERSION"
        remove_copyfail_mitigation
        return
    else
        Log "Installed kernel ($INSTALLED_KERNEL_VERSION) is lower than $REQUIRED_KERNEL_VERSION"
    fi

fi
