#!/bin/sh
# upgrade-ux postremove.sh

echo "       * postremove.sh starts"

# remove man page
[[ -f /usr/share/man/man8.Z/upgrade-ux.8 ]] && rm -f /usr/share/man/man8.Z/upgrade-ux.8
echo "       * Removed /usr/share/man/man8.Z/upgrade-ux.8 man page"
