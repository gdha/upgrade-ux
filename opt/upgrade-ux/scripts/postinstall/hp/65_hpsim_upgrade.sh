# 65_hpsim_upgrade.sh
[[ ! -f /usr/local/bin/HPSIM-Upgrade-RSP.sh ]]  &&  return

LogPrint "Executing: /usr/local/bin/HPSIM-Upgrade-RSP.sh"
if (( PREVIEW )) ; then
    /usr/local/bin/HPSIM-Upgrade-RSP.sh >&2
else
    /usr/local/bin/HPSIM-Upgrade-RSP.sh  -i  >&2
fi
