# 50_add_tcp_sack_in_nddconf.sh
#
# 14/10/27 - This Critical Warning has been issued by HP.
# - PHNE_42470 introduced behavior that may result in data
# corruption when TCP SACK is used.
# - This behavior is also experienced with superseding patches
# PHNE_43412 and PHNE_43814.
# - HP does not recommend removing the patches. To avoid this
# behavior, HP recommends that TCP SACK be disabled using the
# following command:
# /usr/bin/ndd -set /dev/tcp tcp_sack_enable 0
# This will apply to new TCP connections.
# In order to have this change persist after a system reboot,
# the following entries must be added to
# /etc/rc.config.d/nddconf:
# TRANSPORT_NAME[x]=tcp
# NDD_NAME[x]=tcp_sack_enable
# NDD_VALUE[x]=0

[[ "$OS_VERSION" = "11.11" ]]       && return    # HP-UX 11.11 is not impacted

if (( PREVIEW )) ; then
    Log "tcp_sack_enable will not be disabled [not in preview mode]"
    return
fi

Log "Disabling tcp_sack_enable in kernel"
/usr/bin/ndd -set /dev/tcp tcp_sack_enable 0

Log "Add entries to /etc/rc.config.d/nddconf to disable tcp_sack_enable"

cp -p /etc/rc.config.d/nddconf "$VAR_DIR/$DS/nddconf.after"

nddnr=$(grep -v \# /etc/rc.config.d/nddconf | tail -1 | cut -d[ -f2 | cut -d] -f1)
nddnr=$((nddnr + 1))
PrintIfError "50_add_tcp_sack_in_nddconf.sh: could not grab last array number in /etc/rc.config.d/nddconf"

echo "TRANSPORT_NAME[$nddnr]=tcp" >> "$VAR_DIR/$DS/nddconf.after"
echo "NDD_NAME[$nddnr]=tcp_sack_enable" >> "$VAR_DIR/$DS/nddconf.after"
echo "NDD_VALUE[$nddnr]=0" >> "$VAR_DIR/$DS/nddconf.after"

cmp -s "$VAR_DIR/$DS/nddconf.before" "$VAR_DIR/$DS/nddconf.after"
if (( $? == 1 )); then
    LogPrint "Following was added to /etc/rc.config.d/nddconf:"
    sdiff -s "$VAR_DIR/$DS/nddconf.before" "$VAR_DIR/$DS/nddconf.after"
    sdiff -s "$VAR_DIR/$DS/nddconf.before" "$VAR_DIR/$DS/nddconf.after" >&2
    cp "$VAR_DIR/$DS/nddconf.after" /etc/rc.config.d/nddconf
    chmod 444 /etc/rc.config.d/nddconf
    chown bin:bin /etc/rc.config.d/nddconf
fi

