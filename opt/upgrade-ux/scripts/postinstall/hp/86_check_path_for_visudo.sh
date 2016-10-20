# 86_check_path_for_visudo.sh
# /usr/local/sbin/visudo is not part of the default PATH
# we have two choices:
#  1. add PATH to /etc/PATH file, or
#  2. link /usr/local/sbin/visudo to /usr/sbin/visudo
#
[[ ! -f /usr/local/sbin/visudo ]] && return   # makes no sense to go further without this executable
[[   -h /usr/sbin/visudo ]] && return         # symbolic link already in place; we are done

# at this point the source /usr/local/sbin/visudo exists, and no symbolic link found

if (( PREVIEW )) ; then
    : 
else
    ln -s /usr/local/sbin/visudo /usr/sbin/visudo
    Log "Created missing symbolic link /usr/sbin/visudo"
fi
