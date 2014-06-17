# 20_uncomment_cfg2html_in_crontab.sh
#
# if cfg2html is installed there should be a crontab entry of cfg2html
# which is commented by default - we would like to enable it if command[]="uncomment_cfg2html_in_crontab"
# a dummy script tag has been set in the INI file

# script 10_configure_commands.sh would touch below file if required
[[ ! -f "TMP_DIR/uncomment_cfg2html_in_crontab" ]] && return   # nothing to do

[[ ! -f "/etc/cron.d/cfg2html" ]] && return              # we miss the cron.d/cfg2html file

grep "/usr/sbin/cfg2html" "/etc/cron.d/cfg2html" > "$TMP_DIR/current.cfg2html.entry.in.crontab"

if [[ -s "$TMP_DIR/current.cfg2html.entry.in.crontab" ]]; then
    # we found a cfg2html entry in crontab
    grep -q "^\#" "$TMP_DIR/current.cfg2html.entry.in.crontab"
    if (( $? == 0 )) ; then
        # line was commented; so redefine it
	echo "# Comment next line to disable cfg2html runs (changed on $(date '+%d %b %Y') )" >> "$TMP_DIR/cron.cfg2html.new"
	cut -c2- "$TMP_DIR/current.cfg2html.entry.in.crontab" >> "$TMP_DIR/cron.cfg2html.new"
    fi
fi

[[ ! -f "$TMP_DIR/cron.cfg2html.new" ]] && return    # no new crontab made; so return here

if (( PREVIEW )) ; then
    Log "Cron entries for cfg2html were modified [not in preview mode]"
    tail -2 "$TMP_DIR/cron.cfg2html.new" >&2
else
   Log "Cron entries for cfg2html were modified"
   tail -2 "$TMP_DIR/cron.cfg2html.new" >&2
   Log "Activating new cron entries for cfg2html"
   cp -f "$TMP_DIR/cron.cfg2html.new" "/etc/cron.d/cfg2html"
fi
