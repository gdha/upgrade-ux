# 65_hpsim_upgrade.sh

if (( YEAR >= 2018 )) ; then
    # IRS is in use so no need for HPSIM related tasks anymore
    return
fi

[[ ! -f /usr/local/bin/HPSIM-Upgrade-RSP.sh ]]  &&  return

LogPrint "Executing: /usr/local/bin/HPSIM-Upgrade-RSP.sh"
if (( PREVIEW )) ; then
    /usr/local/bin/HPSIM-Upgrade-RSP.sh >&2
else
    /usr/local/bin/HPSIM-Upgrade-RSP.sh  -i  >&2
fi
