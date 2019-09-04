# postinstall/GNU/Linux/61_save_and_diff_extend_filesystem_features.sh
# See https://github.com/gdha/upgrade-ux/issues/109
# Purpose: we had issues with an ext3 file system where suddently an ext4 feauture got added and as a
# result it could not mount this ext3 file system. We had to mount it as an ext4 file system.
[[ ! -x /bin/findmnt ]] && return  # we need this command
[[ ! -x /bin/lsblk ]]   && return  # we need this command


lsblk -fipl > "$VAR_DIR/$DS/lsblk.after"

[[ ! -x /usr/sbin/dumpe2fs ]] && return # we need this to view the feautures of an extend file system

# What we want to is to join the output of e.g.
# dumpe2fs -h /dev/mapper/vg00-lv_log 2>/dev/null | grep "Filesystem features" | cut -d: -f2
#       has_journal ext_attr resize_inode dir_index filetype needs_recovery sparse_super large_file
# to a line of the output of findmnt where the file system type is extend (ext2, ext3 or ext4).
# Note: dumpe2fs needs 'root' privs

printf "%-20s %-30s %-9s %-22s %s\n" "TARGET" "SOURCE" "FSTYPE" "OPTIONS" "EXTEND FEATURES" > "$VAR_DIR/$DS/findmnt.after"

/bin/findmnt -s | while read target source fstype options
do
    case "$fstype" in
        FSTYPE) continue ;;
        ext2|ext3|ext4)
               echo "$source" | grep -q "UUID" && {
                 uuid=$( echo "$source" | cut -d= -f2 )
                 source=$( grep $uuid $VAR_DIR/$DS/lsblk.before | awk '{print $1}' )
               } 
               features="$( /usr/sbin/dumpe2fs -h "$source" 2>/dev/null | grep "Filesystem features" | cut -d: -f2 | sed -e 's/^[ \t]*//' )"
               printf "%-20s %-30s %-9s %-22s %s\n" "$target" "$source" "$fstype" "$options" "$features" >> "$VAR_DIR/$DS/findmnt.after"
               ;;
        *)     printf "%-20s %-30s %-9s %-22s\n" "$target" "$source" "$fstype" "$options" >> "$VAR_DIR/$DS/findmnt.after"
               ;;
    esac 
done

# The DIFF part follows:
cmp -s "$VAR_DIR/$DS/findmnt.before" "$VAR_DIR/$DS/findmnt.after"
if (( $? == 1 )); then
    LogPrint "WARNING: Extend file system feature(s) changed during patching:"
    diff "$VAR_DIR/$DS/findmnt.before" "$VAR_DIR/$DS/findmnt.after" >&2
fi
