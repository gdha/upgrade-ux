# 62_save_failed_systemd_services.sh
# Purpose is to log all failed systemd services 'before' we patch to avoid
# discussion after patching where people say it worked before.
if type -p systemctl >/dev/null 2>&1 ; then
   systemctl --failed > "$VAR_DIR/$DS/failed_systemd_service.before"
fi
