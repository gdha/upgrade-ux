# 37_check_diskspace_requirements.sh
#
# YUM does check on itself that there is enough disk space present - see:
# https://rhn.redhat.com/errata/RHBA-2015-1384.html
#   1174612 - RFE: backport --assumeno option to yum (https://bugzilla.redhat.com/show_bug.cgi?id=1174612)
#

# We will use at this point the values from the "patch-pre-check.sh" script as is
diskspace_err=0

disk_avail=$(df --direct -m / | tail -1 | awk '{print $4}')
if (( disk_avail < 1000 )) ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: insufficient space available in / (available ${disk_avail} MB; required 1000 MB)"
        diskspace_err=$(( diskspace_err + 1 ))
    else
        Error "Insufficient space available in / (available ${disk_avail} MB; required 1000 MB)"
    fi
fi

disk_avail=$(df --direct -m /boot | tail -1 | awk '{print $4}')
[[ "$OS_VENDOR_VERSION" == "rhel/9" ]] && min_boot_space=25 || min_boot_space=20
if (( disk_avail < min_boot_space )) ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: insufficient space available in /boot (available ${disk_avail} MB; required $min_boot_space MB)"
        diskspace_err=$(( diskspace_err + 1 ))
    else
        Error "Insufficient space available in /boot (available ${disk_avail} MB; required $min_boot_space MB)"
    fi
fi

disk_avail=$(df --direct -m /tmp | tail -1 | awk '{print $4}')
if (( disk_avail < 1000 )) ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: insufficient space available in /tmp (available ${disk_avail} MB; required 1000 MB)"
        diskspace_err=$(( diskspace_err + 1 ))
    else
        Error "Insufficient space available in /tmp (available ${disk_avail} MB; required 1000 MB)"
    fi
fi

disk_avail=$(df --direct -m /var | tail -1 | awk '{print $4}')
if (( disk_avail < 1200 )) ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: insufficient space available in /var (available ${disk_avail} MB; required 1200 MB)"
        LogPrint "ERROR: -> Try to clean up duplicates packages (use 'package-cleanup --cleandupes -y')"
        Log "Show duplicate, or orphaned packages"
        package-cleanup --dupes >&2
        diskspace_err=$(( diskspace_err + 1 ))
    else
        Error "Insufficient space available in /var (available ${disk_avail} MB; required 1200 MB)"
    fi
fi

if (( diskspace_err > 0 )) ; then
    if (( PREVIEW )) ; then
        LogPrint "ERROR: Please increase disk space or do a clean up before applying patches"
        LogPrint "ERROR: Action required!"
    fi
fi
