# 52_save_centrifydc.sh

[[ ! -x /usr/bin/adinfo ]] && return     # adinfo is not available when CentrifyDC is not installed

Log "Active Directory software installed $( /usr/bin/adinfo -v | awk '{print $2,$3}' )"

#[[ -f "$VAR_DIR/$DS/centrifydc.after" ]] &&  return  # we already have a copy

cp -p /sbin/init.d/centrifydc "$VAR_DIR/$DS/centrifydc.after"
cp -p /etc/centrifydc/centrifydc.conf "$VAR_DIR/$DS/centrifydc.conf.after"

cver=$( /usr/bin/adinfo -v | awk ' {print $3}'|sed -e '$s/.$//' )

/usr/bin/adinfo > "$VAR_DIR/$DS/centrifydc-adinfo-${cver}.after"
Log "CentrifyDC mode is $(/usr/bin/adinfo -m)"
