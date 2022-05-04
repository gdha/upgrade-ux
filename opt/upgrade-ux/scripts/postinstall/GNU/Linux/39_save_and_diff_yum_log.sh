# 39_save_and_diff_yum_log.sh

# we will always save a copy when we are almost done (to be sure)
if [[ -f /var/log/yum.log ]] ; then
   cp /var/log/yum.log "$VAR_DIR/$DS/dnf.log.after"
fi
if [[ -f /var/log/dnf.log ]] ; then
   cp /var/log/dnf.log "$VAR_DIR/$DS/dnf.log.after"
fi

# if we do not have a 'before' copy we cannot compare (should never be the case)
[[ ! -f "$VAR_DIR/$DS/yum.log.before" && ! -f "$VAR_DIR/$DS/dnf.log.before" ]] && return

if [[ -f "$VAR_DIR/$DS/yum.log.after" ]] ; then
   cmp -s "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"
   if ((  $? == 1 )); then
      # Log to logfile only (otherwise too much info on the screen going by)
      Log "The differences in yum.log are:"
      diff "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"  | grep '^<' | cut -c2- >&2
   fi
elif [[ -f "$VAR_DIR/$DS/dnf.log.after" ]] ; then
   cmp -s "$VAR_DIR/$DS/dnf.log.after" "$VAR_DIR/$DS/dnf.log.before"
   if ((  $? == 1 )); then
      # Log to logfile only (otherwise too much info on the screen going by)
      Log "The differences in dnf.log are:"
      diff "$VAR_DIR/$DS/dnf.log.after" "$VAR_DIR/$DS/dnf.log.before"  | grep '^<' | cut -c2- >&2
   fi
fi
