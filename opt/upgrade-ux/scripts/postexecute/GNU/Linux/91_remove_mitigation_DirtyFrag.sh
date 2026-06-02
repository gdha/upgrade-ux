# Script 91_remove_mitigation_DirtyFrag.sh

function remove_dirtyfrag_mitigation {
    if [[ -f /etc/modprobe.d/dirtyfrag.conf ]]; then
       rm -f /etc/modprobe.d/dirtyfrag.conf
       LogPrint "Remove Dirty Frag mitigation /etc/modprobe.d/dirtyfrag.conf"
    fi
    Log "Kernel is protected against the Dirt Frag vulnerability"
}

if (( PREVIEW )) ; then
    : # do nothing and say nothing
else
    Log "Checking kernel version for the Dirty Frag kernel vulnerability"
    # Before removing the mitigation we need to verify kernel versions
    #CURRENT_KERNEL_VERSION="$(uname -r)"
    #CURRENT_KERNEL_VERSION="${CURRENT_KERNEL_VERSION%.x86_64}"
    # Grab the kernel version that will be installed (will only work on RHEL based OSes)
    INSTALLED_KERNEL_VERSION="$(grep 'Package kernel.x86' $LOGFILE 2>/dev/null| grep installed  | awk '{print $6}' | sort -u)"
    [[ -z "$INSTALLED_KERNEL_VERSION" ]] && return

    case "$OS_VENDOR_VERSION" in
       ("rhel/8")
           REQUIRED_KERNEL_VERSION="4.18.0-553.124.1.el8_10"
           ;;
       ("rhel/9")
           REQUIRED_KERNEL_VERSION="5.14.0-611.55.1.el9_7"
           ;;
       ("rhel/10")
           REQUIRED_KERNEL_VERSION="6.12.0-124.56.1.el10_1"
           ;;
       (*)
           return
           ;;
    esac
    # Now we can compare the kernels
    #if [[ "$(printf '%s\n%s' "$REQUIRED_KERNEL_VERSION" "$CURRENT_KERNEL_VERSION" | sort -V | head -n1)" = "$REQUIRED_KERNEL_VERSION" ]]; then
    #    Log "Current kernel ($CURRENT_KERNEL_VERSION) is higher than or equal to $REQUIRED_KERNEL_VERSION"
    #    remove_dirtyfrag_mitigation
    #    return
    #else
    #    Log "Current kernel ($CURRENT_KERNEL_VERSION) is lower than $REQUIRED_KERNEL_VERSION"
    #fi
    if [[ "$(printf '%s\n%s' "$REQUIRED_KERNEL_VERSION" "$INSTALLED_KERNEL_VERSION" | sort -V | head -n1)" = "$REQUIRED_KERNEL_VERSION" ]]; then
        Log "Installed kernel ($INSTALLED_KERNEL_VERSION) is higher than or equal to the required kernel $REQUIRED_KERNEL_VERSION version"
        remove_dirtyfrag_mitigation
    else
        Log "Installed kernel ($INSTALLED_KERNEL_VERSION) is lower than the required kernel $REQUIRED_KERNEL_VERSION version"
        Log "Leave the Dirty Frag mitigation /etc/modprobe.d/dirtyfrag.conf intact"
    fi

fi
