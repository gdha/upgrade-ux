# 63_save_journal_errors.sh
# Purpose is to save before patching all errors found in the journal since today.
# This may proof that some services were already showing errors before we patched.
# To avoid discussions after patching...
if type -p journalctl >/dev/null 2>&1 ; then
   journalctl -p err --since today > "$VAR_DIR/$DS/journal_errors_today.before"
fi
