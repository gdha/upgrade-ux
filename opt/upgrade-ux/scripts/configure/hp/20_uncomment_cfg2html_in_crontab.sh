# 20_uncomment_cfg2html_in_crontab.sh
#
# if cfg2html is installed there should be a crontab entry of cfg2html
# which is commented by default - we would like to enable it if command[]="uncomment_cfg2html_in_crontab"
# a dummy script tag has been set in the INI file

# script 10_configure_commands.sh would touch below file if required
[[ ! -f "$TMP_DIR/uncomment_cfg2html_in_crontab" ]] && return   # nothing to do

# ok now check crontab entries ($VAR_DIR/$DS/crontab.after)
[[ ! -f "$VAR_DIR/$DS/crontab.after" ]] && return              # we missed the crontab file??

grep "/usr/sbin/cfg2html" "$VAR_DIR/$DS/crontab.after" > "$TMP_DIR/current.cfg2html.entry.in.crontab"

if [[ -s "$TMP_DIR/current.cfg2html.entry.in.crontab" ]]; then
    # we found a cfg2html entry in crontab
    grep -q "^\#" "$TMP_DIR/current.cfg2html.entry.in.crontab"
    if [[ $? -eq 0 ]]; then
        # line was commented; so redefine it (by first removing the old lines)
	crontab -l | grep -v "cfg2html" > "$TMP_DIR/crontab.new"
	# then adding the new cfg2html lines again
	echo "# Comment next line to disable cfg2html runs (changed on $(date '+%d %b %Y') )" >> "$TMP_DIR/crontab.new"
	cut -c2- "$TMP_DIR/current.cfg2html.entry.in.crontab" >> "$TMP_DIR/crontab.new"
    fi
fi

[[ ! -f "$TMP_DIR/crontab.new" ]] && return    # no new crontab made; so return here

if (( PREVIEW )) ; then
    Log "Crontab entries for cfg2html were modified [not in preview mode]"
    tail -2 "$TMP_DIR/crontab.new" >&2
else
   Log "Crontab entries for cfg2html were modified"
   tail -2 "$TMP_DIR/crontab.new" >&2
   Log "Activating new crontab"
   crontab "$TMP_DIR/crontab.new"
fi
