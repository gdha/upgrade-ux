# postexecute/GNU/Linux/60_save_knife_node_output.sh
# see also https://github.com/gdha/upgrade-ux/issues/100

if type -p knife >/dev/null 2>&1 ; then
    [[ ! -f /etc/chef/client.rb ]] && return  # we need this file to continue
    if (( PREVIEW )) ; then
        Log "knife node show (after patching) [not in preview mode]"
        return
    fi
    knife node show $( grep node_name /etc/chef/client.rb | cut -d\" -f 2 ) -l -c /etc/chef/client.rb  > "$VAR_DIR/$DS/knife_node_show.after"
fi
