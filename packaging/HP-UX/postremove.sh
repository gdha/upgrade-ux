#!/bin/sh
# upgrade-ux postremove.sh

echo "       * postremove.sh starts"

# remove man page
if [[ -f /usr/share/man/man8.Z/upgrade-ux.8 ]]; then
    rm -f /usr/share/man/man8.Z/upgrade-ux.8
    echo "       * Removed /usr/share/man/man8.Z/upgrade-ux.8 man page"
fi
