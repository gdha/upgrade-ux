# 64_save_control_m_config.sh
if (( PREVIEW )) ; then
   # save a copy of Control-M configuration file
   if [[ -f /opt/TIDAL/BMC/ctmagent/ctm/data/CONFIG.dat ]]  ; then
      cp -p /opt/TIDAL/BMC/ctmagent/ctm/data/CONFIG.dat  "$VAR_DIR/$DS/control-M-config.dat"
      Log "Saved Control-M /opt/TIDAL/BMC/ctmagent/ctm/data/CONFIG.dat as $VAR_DIR/$DS/control-M-config.dat"
   fi
fi
