# prep/GNU/Linux/50_save_default_runlist.sh

# /etc/systemd/system/default.target is a symbolic link to the default runlevel on this system
[[ ! -h /etc/systemd/system/default.target ]]  && return  # no Systemd in place; skip this script

runlevel=$( ls -l /etc/systemd/system/default.target | awk 'NF>1{print $NF}' ) # /usr/lib/systemd/system/multi-user.target
runlevel=$( basename $runlevel ) # multi-user.target
runlevel=${runlevel%.*} #  multi-user

# we shall always save the default runlevel before we start patching (as it could be changed manually)
echo "$runlevel" > "$VAR_DIR/$DS/default.runlevel.before"

# However, it is the purpose that we go back to the multi-user runlevel as default after patching
# We will do this in the postexecute/GNU/Linux stage
