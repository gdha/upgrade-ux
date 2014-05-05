# 37_verify_estape.sh
#
[[ "$OS_VERSION" != "11.31" ]] && return  # only meant for HP-UX 11.31 systems

[[ ! -x /usr/sbin/scsimgr ]] && return    # in case we do not have this executable; just return

/usr/sbin/scsimgr -d estape get_attr > $TMP_DIR/estape
[[ ! -s $TMP_DIR/estape ]] && return    # no output - no driver most likely
##
#	DRIVER estape GLOBAL ATTRIBUTES:
##
	#name = version
	#current = 0.1
	#default =
	#saved =
##
	#name = norewind_close_disabled
	#current = 1
	#default = 0
	#saved = 1
##
	#name = st_ats_enable
	#current = 0
	#default = 0
	#saved =
##


norewind_close_disabled=$(SurroundingGrep 0 4 'norewind_close_disabled' $TMP_DIR/estape | grep current | awk '{print $3}' )
st_ats_enable=$(SurroundingGrep 0 4 'st_ats_enable' $TMP_DIR/estape | grep current | awk '{print $3}' )

if [[ "$norewind_close_disabled" != "1" ]]; then
    /usr/sbin/scsimgr set_attr  -d estape  -a norewind_close_disabled=1
    /usr/sbin/scsimgr save_attr  -d estape  -a norewind_close_disabled=1
    LogPrint "Value changed of norewind_close_disabled to 1"
fi
if [[ "$st_ats_enable" != "0" ]]; then
    /usr/sbin/scsimgr set_attr  -d estape  -a st_ats_enable=0
    /usr/sbin/scsimgr save_attr  -d estape  -a st_ats_enable=0
    LogPrint "Value changed of st_ats_enable to 0"
fi

Log "Output of /usr/sbin/scsimgr -d estape get_attr:"
/usr/sbin/scsimgr -d estape get_attr >&2
