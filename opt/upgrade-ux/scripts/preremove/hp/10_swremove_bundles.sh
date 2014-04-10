# 10_swremove_bundles.sh
########################
count=${#bundle[@]}
i=0
while (( $i < $count ))
do
    if (( PREVIEW_MODE )) ; then
        ${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]}
    else
        ${command[i]} -vp ${options[i]} ${bundle[i]},r=${version[i]}
    fi
    i=$((i+1))
done

