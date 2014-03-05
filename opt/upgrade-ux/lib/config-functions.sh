# config-functions.sh
#

# find out which OS Vendor and Version we run on (SuSE, SLES, RHEL, Fedora, Debian, ...)
function SetOSVendorAndVersion  {
    # if (magically) these variables are already set, skip doing it again
    # this is needed, so that they can be overridden in $WORKFLOW.conf
    # if this happens, then ALL the variables OS_* have to be set there !!
    #
    case $platform in
        Linux)
                if [ -f /etc/os-release ] ; then
                    ID=$( grep ^ID /etc/os-release | cut -d= -f2 | sed -e 's/"//g' )
                    VERSION_ID=$( grep ^VERSION_ID /etc/os-release | cut -d= -f2 | sed -e 's/"//g' | cut -d. -f1 )
                    OS_VENDOR="$ID"
                    OS_VERSION="$VERSION_ID"
                elif [ -f /etc/SuSE-release ] ; then
                    OS_VENDOR="suse"
                    OS_VERSION=$( grep VERSION /etc/SuSE-release | awk '{print $3}' )
                elif [ -f /etc/fedora-release ] ; then
                    OS_VENDOR="fedora"
                    OS_VERSION=$( cat /etc/fedora-release | awk '{print $3}' )
                elif [ -f /etc/redhat-release ] ; then
                    OS_VENDOR="redhat"
                    OS_VERSION=$( cat /etc/redhat-release | awk '{print $7}' | cut -d. -f1 )
                else
                    OS_VENDOR=generic
                    OS_VERSION=none
                fi
                ;;
        *)     # HP-UX, Solaris, AIX
               OS_VENDOR="$platform"
               OS_VERSION=$osVer
               ;;
    esac
    if test "$OS_VENDOR" = generic -o "$OS_VERSION" = none ; then

        # try to use lsb_release
        if has_binary lsb_release >&8 2>&1; then
            OS_VENDOR="$(lsb_release -i -s | tr -s " \t" _)"
            OS_VERSION="$(lsb_release -r -s | tr -s " \t" _)"
        else
            # we have to go the classical way
            Error "The LSB package is not installed.
    Currently there is no support to detect the OS and VERSION without LSB support.
    Please either install the LSB package (that supplies the 'lsb_release' command)
    or improve $PRODUCT to handle this situation better.

    As an alternative you can manually override OS_VENDOR and OS_VERSION in the
    '$ETC_DIR/os.conf' file. Please be sure to test your setup !

    See '$SHARE_DIR/lib/config-functions.sh' for more details about this matter.
"
        fi #  has_binary lsb_release
    fi # test "$OS_VENDOR"

    # combined stuff
    OS_VENDOR_VERSION="$OS_VENDOR/$OS_VERSION"
    OS_VENDOR_ARCH="$OS_VENDOR/$model"
    OS_VENDOR_VERSION_ARCH="$OS_VENDOR/$OS_VERSION/$model"

    # add OS_MASTER_* vars in case this is a derived OS
    case "$( echo $OS_VENDOR_VERSION | tr '[:upper:]' '[:lower:]' )" in
        (*oracle*|*centos*|*fedora*|*redhat*|*rhel*|*scientific*)
            OS_MASTER_VENDOR="fedora"
            case "$OS_VERSION" in
                (5.*)
                    # map all RHEL 5.x and clones to Fedora/5
                    # this is safe because FedoraCore 5 never existed
                    OS_MASTER_VERSION="5"
                    ;;
                (6.*)
                    # map all RHEL 6.x and clones to Fedora/6
                    OS_MASTER_VERSION="6"
                    ;;
                (7.*)
                    # map all RHEL 7.x and clones to Fedora/7
                    OS_MASTER_VERSION="7"
                    ;;
                (*)
                OS_MASTER_VERSION="$OS_VERSION"
                ;;
            esac
            ;;
        (*ubuntu*|*linuxmint*)
            OS_MASTER_VENDOR="debian"
            OS_MASTER_VERSION="$OS_VERSION"
            ;;
        (*archlinux*)
            OS_MASTER_VENDOR="arch"
            OS_MASTER_VERSION="$OS_VERSION"
            ;;
    esac

    # combined stuff for OS_MASTER_*
    if [ "$OS_MASTER_VENDOR" ] ; then
        OS_MASTER_VENDOR_VERSION="$OS_MASTER_VENDOR/$OS_MASTER_VERSION"
        OS_MASTER_VENDOR_ARCH="$OS_MASTER_VENDOR/$model"
        OS_MASTER_VENDOR_VERSION_ARCH="$OS_MASTER_VENDOR/$OS_MASTER_VERSION/$model"
    fi

}

function show_var {
    # show variable, input is name of variable [string], output is content of VAR
    # in bash this is the same as "echo ${!1}"
    # this function works in bash and ksh
    VAR="\$${1}"
    eval echo ${VAR}
}
