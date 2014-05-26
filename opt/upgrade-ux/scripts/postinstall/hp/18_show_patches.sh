# 18_show_patches.sh
# save the output of show_patches to make it easier to grep for patches
[[ ! -x /usr/contrib/bin/show_patches ]] && return

/usr/contrib/bin/show_patches > "$SHOW_PATCHES_AFTER"
