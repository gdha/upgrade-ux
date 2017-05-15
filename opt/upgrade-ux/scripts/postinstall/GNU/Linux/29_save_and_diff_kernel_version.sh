# 29_save_and_diff_kernel_version.sh

if [[ -f "$VAR_DIR/$DS/kernel-version.before" ]] ; then
    CURRENT_KERNEL=$(cat $VAR_DIR/$DS/kernel-version.before)  # e.g. 3.10.0-327.13.1.el7.x86_64
else
    CURRENT_KERNEL=$(uname -r)   # assuming we did not yet reboot (most likely not the case)
fi

# TODO: this is for RHEL/SLES only for the moment - next line should become a case statement
[[ ! -x $RPM ]] && return  # rpm executable not available; just return

AVAILABLE_KERNEL=$( $RPM -q --last kernel | awk '{print $1}' | cut -d- -f2- | head -1 )

echo "$AVAILABLE_KERNEL" > "$VAR_DIR/$DS/kernel-version.after"


cmp -s "$VAR_DIR/$DS/kernel-version.before" "$VAR_DIR/$DS/kernel-version.after"
if (( $? == 1 )); then
    LogPrint "Kernel was updated from $CURRENT_KERNEL to $AVAILABLE_KERNEL"
    # A reboot will be required to get the new kernel in action
    touch "$VAR_DIR/$DS/reboot-required"
fi
