# 40_needs_restarting.sh

# Which packages require a system reboot after update?
# ---------------------------------------------------
# Reference: https://access.redhat.com/solutions/27943
# Red Hat recommends that systems be rebooted after installation of an updated package.
# This ensures that all processes and services benefit from updates to core libraries and services.
# Such reboots do come at a cost to system uptime, however, which we know many customers are keen to avoid.
# This article outlines when a reboot is required, best practice for customers following updates,
# and guidance on particular package update scenarios.

# Each of the following packages requires a reboot in order to be fully-utilized.
# This list is for informational use and subject to change at Red Hat's discretion.

#    Red Hat Enterprise Linux 5:
#        kernel
#        kernel-smp
#        kernel-PAE
#        kernel-xen
#        glibc2
#        hal

#    Red Hat Enterprise Linux 6:
#        kernel
#        *-firmware-*
#        glibc[^2]
#        hal

#    Red Hat Enterprise Linux 7:
#        kernel
#        glibc[^2]
#        linux-firmware
#        systemd
#        udev

# RHEL contains a nice utility called "need-restarting" (part of yum-utils)
# For more information on "need-restarting" https://access.redhat.com/discussions/2485141?tour=8
# Another very interesting tool that is available in EPEL is "Tracer":
# https://github.com/FrostyX/tracer
# However, that is out-of-scope for upgrade-ux, but I thought still worth mentioning

LogPrint "Do we need restarting of services or reboot?"
if (( PREVIEW )) ; then
    LogPrint "No reboot seems necessary"
    return
fi

if has_binary needs-restarting ; then
    # RHEL-alike systems
    rm -f "$VAR_DIR/$DS/reboot-required" # could be made by postinstall/GNU/Linux/29_save_and_diff_kernel_version.sh
    # "needs-restarting -r" will always output something in the stdout; however $rc=1 means reboot is required
    # but a bad yum repo will not result in a false positive (see #108)
    needs-restarting -r > "$VAR_DIR/$DS/needs-restarting"
    rc=$?
    if (( rc )) ; then
        touch "$VAR_DIR/$DS/reboot-required"
        Log "Processes that require a restart:"
        cat "$VAR_DIR/$DS/needs-restarting" >&2
    fi
fi

#lsof +c0 -d DEL | grep -v '\s/SYSV' |awk 'NR==1 || !/dev\/zero/ {print $2,$1,$4,$NF}' | column -t > "$VAR_DIR/$DS/dead-processes"
#counter=$( cat "$VAR_DIR/$DS/dead-processes" | grep -v ora | wc -l )
#if (( counter > 1 )) ; then
#     touch "$VAR_DIR/$DS/reboot-required"
#     Log "Processes that are dead or need a restart:"
#     cat "$VAR_DIR/$DS/dead-processes" >&2

# On Debian-alike systems we rely on a kernel version update as we do not have "needs-restarting" executable available
# If a newer kernel was installed then postinstall/GNU/Linux/29_save_and_diff_kernel_version.sh would have created
# the $VAR_DIR/$DS/reboot-required file
# Or, if the file /var/run/reboot-required exist
if [[ -f "$VAR_DIR/$DS/reboot-required" ]] || [[ -f /var/run/reboot-required ]]; then
     LogPrint "*********************************"
     LogPrint "** Reboot seems to be required **"
     LogPrint "*********************************"
else
     LogPrint "No reboot seems necessary"
fi
