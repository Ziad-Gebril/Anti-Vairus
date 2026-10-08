#!/bin/bash


dir="${dir:-/home/ziad-gebril/Desktop/Anti Vairus/dir}"
malicious_dir="${malicious_dir:-/home/ziad-gebril/Desktop/Anti Vairus/malicious_dir}"
interval="${interval:-5}"

interval="10"
malicious_ex=("exe" "bat" "vbs" "scr" "ps1")
malicious_key=("virus" "trojan" "malware" "worm" "ransomware")


info_new="directory-info.new"
info_last="directory-info.last"

getInfo() {
    ls -l "$dir" > "$info_new"
    echo "scanning: $dir"
}

init() {
    getInfo
    cp "$info_new" "$info_last"
}

compInfo() {
    cmp -s "$info_last" "$info_new";
}

scanF() {
        for file in "$dir"/*; do
            [ -f "$file" ] || continue

            fname=$(basename "$file")
            echo $fname

            for key in ${malicious_key[@]}; do
                if grep -qi "$key" "$file"; then
                    echo "<$file> has malicious word <$key> and the file is DELETED"
                    mv "$file" "$malicious_dir/"
                    break 2
                fi
            done
        done
}


scan() {
    while true; do

    getInfo

    for file in "$dir"/*; do
        [ -f "$file" ] || continue

        fname=$(basename "$file")
        echo $fname

        ext=${fname##*.}
        echo $ext

        for ex in ${malicious_ex[@]}; do
            if [ "$ext" == "$ex" ]; then
                echo "<$file> is malicious and it is DELETED"
                mv "$file" "$malicious_dir/"
                break
            fi
        done

    done

    if ! compInfo; then
        echo "diff"
        scanF
    else
        echo "same"
    fi

    cp "$info_new" "$info_last"
    sleep "$interval"

    done
}



scan