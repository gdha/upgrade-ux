# 10_swremove_bundles.sh
########################
count=${#bundle[@]}
i=0
while (( i < count ))
do
    [[ -z "${command[i]}" ]] && continue   # command seems to be empty
    if (( PREVIEW )) ; then
        Log "${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]}"
        ${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]} >&2
    else
        Log "${command[i]} -v ${options[i]} ${bundle[i]},r=${version[i]}"
        ${command[i]} -v ${options[i]} ${bundle[i]},r=${version[i]} >&2
    fi
    SwJob ${command[i]} >&2
    i=$((i+1))
done

