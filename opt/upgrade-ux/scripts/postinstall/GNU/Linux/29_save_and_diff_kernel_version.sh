# 29_save_and_diff_kernel_version.sh

(( PREVIEW )) && return  # return in preview mode

if [[ -f "$VAR_DIR/$DS/kernel-version.before" ]] ; then
    CURRENT_KERNEL=$(cat $VAR_DIR/$DS/kernel-version.before)  # e.g. 3.10.0-327.13.1.el7.x86_64
else
    CURRENT_KERNEL=$(uname -r)   # assuming we did not yet reboot (most likely not the case)
fi

if [[ "$OS_MASTER_VENDOR" == "fedora" ]] ; then
    AVAILABLE_KERNEL=$( $RPM -q --last kernel | awk '{print $1}' | cut -d- -f2- | head -1 )
elif [[ "$OS_MASTER_VENDOR" == "debian" ]] ; then
    AVAILABLE_KERNEL=$( find /boot/vmlinuz-* | sort -V | tail -n 1 | sed 's|.*vmlinuz-||' )
else
    AVAILABLE_KERNEL=$(uname -r)
fi
echo "$AVAILABLE_KERNEL" > "$VAR_DIR/$DS/kernel-version.after"


cmp -s "$VAR_DIR/$DS/kernel-version.before" "$VAR_DIR/$DS/kernel-version.after"
if (( $? == 1 )); then
    LogPrint "Kernel was updated from $CURRENT_KERNEL to $AVAILABLE_KERNEL"
    # A reboot will be required to get the new kernel in action
    touch "$VAR_DIR/$DS/reboot-required"
fi
