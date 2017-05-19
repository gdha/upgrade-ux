# prep/default/95_check_missing_programs.sh
# The main script usr/sbin/rear has the same kind of code
# but other prep scripts can add binaries to the REQUIRED_PROGS array
# so we need to double check before leaving the prep stage.

# check for requirements, do we have all required binaries ?
# define an empty array MISSING_PROGS
set -A MISSING_PROGS
for f in "${REQUIRED_PROGS[@]}" ; do
    # if ! has_binary "$f"; then  ## HP-UX does not like the ! has_binary
    if has_binary "$f"; then
        :  # stupid trip to please HP-UX
    else
        set -A MISSING_PROGS "${MISSING_PROGS[@]}" "$f"
    fi
done
[[ -z "$MISSING_PROGS" ]]
StopIfError "Cannot find required programs: ${MISSING_PROGS[@]}"

# we do not require array MISSING_PROGS anymore; get rid of it
unset MISSING_PROGS
