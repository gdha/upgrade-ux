# 56_save_installed_packages.sh

if [[ "$OS_VENDOR" == "rhel" ]] ; then
   if (( $OS_VERSION >= 8 )) ; then
      # We use DNF
      Log "Running $DNF repoquery --installed (before)"
      $DNF repoquery --installed > "$VAR_DIR/$DS/installed_packages.before"
      rc=$?
   else
      # We use YUM
      Log "Running $YUM repoquery --installed (before)"
      $YUM repoquery --installed > "$VAR_DIR/$DS/installed_packages.before"
      rc=$?
   fi
   if [[ $rc -ne 0 ]] ; then
      Error "yum or dnf check had a major issue. Please fix it first!"
   fi
fi

