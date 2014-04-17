# 10_swremove_bundles.sh
########################
count=${#bundle[@]}
i=0
while (( $i < $count ))
do
    if (( PREVIEW )) ; then
        ${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]} >&2
    else
        ${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]} >&2
    fi
    i=$((i+1))
done

