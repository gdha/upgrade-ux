# 08_set_preview_var.sh
# we treat the PREVIEW variable as a numeric being 0 or 1
# we need to double check if it was defined properly to avoid stupid error messages like
# PREVIEW : bad number

# normally $PRODUCT main script presets PREVIEW variable, but still we've seen errors

[[ -z "$PREVIEW" ]] && PREVIEW=0  # when PREVIEW= (default) make it 0 so (( PREVIEW )) works

IsDigit "$PREVIEW" || PREVIEW=1   # when PREVIEW is not 0 or 1 we force PREVIEW mode (safest)
