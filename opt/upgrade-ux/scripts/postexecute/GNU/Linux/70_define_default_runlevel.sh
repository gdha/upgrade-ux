# postexecute/GNU/Linux/70_define_default_runlevel.sh
# in prep stage we saved "default.runlevel.before"

# /etc/systemd/system/default.target is a symbolic link to the default runlevel on this system
[[ ! -h /etc/systemd/system/default.target ]] || [[ ! -h  /lib/systemd/system/default.target ]] && return  # no Systemd in place; skip this script

if [[ -f "VAR_DIR/$DS/default.runlevel.before" ]] ; then
    # read the runlevel before patching
    runlevel_before=$( cat "VAR_DIR/$DS/default.runlevel.before" )
else
    # sane value
    runlevel_before="multi-user.target"
fi

# read current runlevel (after patching)
runlevel=$( ls -l /etc/systemd/system/default.target 2>/dev/null | awk 'NF>1{print $NF}' ) # /usr/lib/systemd/system/multi-user.target
runlevel=$( basename $runlevel ) # multi-user.target

if [[ -z "$runlevel" ]] ; then
    # There was no symlink under /etc/systemd/system, check /lib/systemd/system/default.target instead
    runlevel=$( ls -l /lib/systemd/system/default.target 2>/dev/null | awk 'NF>1{print $NF}' ) # /lib/systemd/system/default.target
    runlevel=$( basename $runlevel ) # graphical.target
fi

# in worst case set the default to something sane as multi-user.target
[[ -z "$runlevel" ]] && runlevel=multi-user.target

if [[ "$runlevel" != "$runlevel_before" ]] ; then
    # current runlevel is different then before
    LogPrint "Before patching the runlevel was '$runlevel_before' and now it is '$runlevel'"
    if (( PREVIEW )) ; then
        LogPrint "Define as default runlevel '$runlevel_before' [not in preview]"
    else
        LogPrint "Define as default runlevel '$runlevel_before'"
        systemctl set-default $runlevel_before
    fi
fi
