# 09_import_rpm_gpg_keys.sh
# To forecome issues with RPM GPG keys not yet being imported which could break upgrade-ux (issue #127)

[[ ! -x $RPM ]] && return 

if (( PREVIEW )) ; then
    Log "Running rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-* [not in preview mode]"
else
    Log "Running rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-*"
    $RPM --import /etc/pki/rpm-gpg/RPM-GPG-KEY-*
fi
