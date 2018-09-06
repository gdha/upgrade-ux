# 08_clear_yum_cache.sh
# the /var/cache/yum directory may be removed before doing a yum update as it can take a lot of space
# that is required to perform the update (temporary space) in /var

if test $YUM ; then
    if (( PREVIEW )) ; then
        Log "Running rm -rf /var/cache/yum [not in preview mode]"
    else
        Log "Running rm -rf /var/cache/yum"
        rm -rf /var/cache/yum >&2
    fi
fi
