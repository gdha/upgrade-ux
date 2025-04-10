# 56_save_installed_packages.sh

if [[ "$OS_VENDOR" == "rhel" ]] ; then
   if (( $OS_VERSION >= 8 )) ; then
      # We use DNF
      Log "Running $DNF repoquery --installed (after)"
      $DNF repoquery --installed > "$VAR_DIR/$DS/installed_packages.after"
   else
      # We use YUM
      Log "Running $YUM repoquery --installed (after)"
      $YUM repoquery --installed > "$VAR_DIR/$DS/installed_packages.after"
   fi
fi

