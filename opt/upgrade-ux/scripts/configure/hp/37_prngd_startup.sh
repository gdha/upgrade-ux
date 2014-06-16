# 37_prngd_startup.sh
# HP-UX 11.11 only thing!
# see issue #23 for all details

[[ "$OS_VERSION" != "11.11" ]]       && return    # is only meant for HP-UX 11.11

[[ ! -h /sbin/rc2.d/S393secsh ]]     && return    # no Secure Shell; then we do not need PRNGd

[[ -h /sbin/rc2.d/S380prngd.rc ]]    && return    # the link is already there; nothing to do

[[ ! -f /sbin/init.d/prngd.rc ]]     && return    # if prngd is not installed; do not bother

ln -s /sbin/init.d/prngd.rc /sbin/rc2.d/S380prngd.rc
Log "Added link /sbin/rc2.d/S380prngd.rc (prngd is needed by sshd)"
