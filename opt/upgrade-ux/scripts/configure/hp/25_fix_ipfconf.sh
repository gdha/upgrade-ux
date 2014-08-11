# 25_fix_ipfconf.sh
# if file (script) "$VAR_DIR/$DS/ipf-fix.script" exist just run it which will disable ipf
# on HP-UX 11.23 when IP Filter sw gets updated it is enabled by default
# Script "$VAR_DIR/$DS/ipf-fix.script" only exists when ipf was disabled before patching

[[ ! -f /etc/rc.config.d/ipfconf ]] && return   # bundle B9901AA (IPF) not installed

# save the new startup configuration file
cp -p /etc/rc.config.d/ipfconf   "$VAR_DIR/$DS/ipfconf.after"

# if "before" patching ipf was "not" active then following script will be available
if [[ -f "$VAR_DIR/$DS/ipf-fix.script" ]]; then

    if (( PREVIEW )) ; then
        Log "Running script ipf-fix.script (to disable ipf at startup) [not done in preview]"
    else
        LogPrint "Running script ipf-fix.script (to disable ipf at startup)" 
        . "$VAR_DIR/$DS/ipf-fix.script" >&2
    fi

fi


# save the new (modified) startup configuration file
cp -p /etc/rc.config.d/ipfconf   "$VAR_DIR/$DS/ipfconf.after.modified"

