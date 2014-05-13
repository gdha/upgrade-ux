# 52_save_centrifydc.sh

[[ ! -x /usr/bin/adinfo ]] && return     # adinfo is not available when CentrifyDC is not installed

Log "Active Directory software installed $( /usr/bin/adinfo -v | awk '{print $2,$3}' )"

[[ -f "$VAR_DIR/$DS/centrifydc.before" ]] &&  return  # we already have a copy

cp /sbin/init.d/centrifydc "$VAR_DIR/$DS/centrifydc.before"
cp /etc/centrifydc/centrifydc.conf "$VAR_DIR/$DS/centrifydc.conf.before"

/usr/bin/adinfo -v | awk ' {print $3}'|sed -e '$s/.$//' > "$VAR_DIR/$DS/centrifydc.version.before"

/usr/bin/adinfo > "$VAR_DIR/$DS/adinfo.before"
Log "CentrifyDC mode is $(/usr/bin/adinfo -m)"
