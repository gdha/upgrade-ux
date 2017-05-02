# GNU/Linux/10_define_hostname.sh
# Original setting of HOSTNAME was in:
#   etc/opt/upgrade-ux/default.conf:HOSTNAME="$(hostname 2>/dev/null || uname -n | cut -d. -f1)"
# On Linux the HOSTNAME variable (derived from hostname) could be the FQDN, but
# we prefer to use the short hostname (derived from hostname -s) on Linux.
# Therefore, we re-define the variable on Linux

HOSTNAME="$(hostname -s 2>/dev/null || uname -n | cut -d. -f1)"
