# 06_yum_clean_all.sh
# The purpose is from 'man yum'
#   clean  Is  used  to clean up various things which accumulate in the yum cache directory over time

if (( PREVIEW )) ; then
    Log "Running $YUM clean all [not in preview mode]"
else
    Log "Running $YUM clean all"
    $YUM clean all >&2
fi
