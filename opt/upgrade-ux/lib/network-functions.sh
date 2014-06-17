# MASKS array is used to find the CIDR number
set -A MASKS \
        0 \
        2147483648 3221225472 3758096384 4026531840 \
        4160749568 4227858432 4261412864 4278190080 \
        4286578688 4290772992 4292870144 4293918720 \
        4294443008 4294705152 4294836224 4294901760 \
        4294934528 4294950912 4294959104 4294963200 \
        4294965248 4294966272 4294966784 4294967040 \
        4294967168 4294967232 4294967264 4294967280 \
        4294967288 4294967292 4294967294 4294967295 \
        -1


function MyIPcalc
{
    # usage : MyIPcalc 192.168.10.20 255.255.254.0
    #         192.168.10.0/23

    typeset -i BITS ADDRESS="$(Ip2Num "$1")"

    if [[ ! -z "$2" ]]; then
        typeset -i i=0 DEC MASK="$(Ip2Num "$2")"
        while (( i < 32 )) ; do
             DEC=${MASKS[$i]}
             (( MASK == DEC )) && break
             i=$(( i + 1))
        done
        (( DEC < 0 )) && _error "Main: netmask [$2] seems to be invalid."
        NETADDR=$(Num2Ip "$(( ADDRESS & MASK ))")
        BITS=$i
    else
        NETADDR=$(Num2Ip "$ADDRESS")
        BITS=32
    fi
    echo "$NETADDR/$BITS"
}

function Quad2Num
{
    # usage : Quad2Num 192 168 10 20
    #         3232238100
    if (( $# == 4 )) ; then
        let n="${1} << 24 | ${2} << 16 | ${3} << 8 | ${4}"
        echo "${n}"
        return 0
    else
        echo "0"
        return 1
    fi
}

function Ip2Num
{
    # usage : Ip2Num 192.168.10.20
    #         3232238100
    IFS="."
    Quad2Num ${1}
}

function Num2Ip
{
    # usage : Num2Ip 3232238100
    #         192.168.10.20
    num="$1"
    d=$(($num % 256))
    c=$(( ($num >> 8 ) % 256 ))
    b=$(( ($num >> 16) % 256 ))
    a=$(( ($num >> 24) % 256 ))
    echo "$a.$b.$c.$d"
}

function GetNetworkAddress
{
    # get network address for the given IP address and (netmask or prefix)
    # CIDR notation
    # usage: GetNetworkAddress 192.168.10.20 255.255.254.0
    #        23
    ip="$1"
    nm="$2"

    if [ -n "$ip" -a -n "$nm" ]; then
        if [ "$nm" = *.* ]; then
            :
        else
            nm=$( PrefixNetmask ${nm} )
        fi
        MyIPcalc ${ip} ${nm} | cut -d '/' -f 2
    fi
}

function PrefixNetmask
{
    # usage : PrefixNetmask 23
    #         255.255.254.0
    pf="$1"
    echo $(Num2Ip "${MASKS[$pf]}")
}

function GetPrefix
{
    # get prefix for the given IP address and mask
    # usage : GetPrefix 192.168.10.20 255.255.254.0
    #         23

    ip="$1"
    nm="$2"

    if [ -n "$ip" -a -n "$nm" ]; then
        MyIPcalc ${ip} ${nm} | cut -d '/' -f 2
    fi
}

