# 15_check_hpvm.sh
[[ ! -f /opt/hpvm/bin/hpvminfo ]] && return  # no HP VM installated

/opt/hpvm/bin/hpvminfo > $TMP_DIR/hpvminfo 2>&1

grep -q "hpvminfo: Not on an HPVM guest, HPVM vPar or HPVM host" $TMP_DIR/hpvminfo  && return  # no hpvm guest running

# TODO: what other output should we check on?
