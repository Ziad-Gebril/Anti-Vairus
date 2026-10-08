#!/bin/bash


dir="${dir:-/home/ziad-gebril/Desktop/Anti Vairus/dir}"
malicious_dir="${malicious_dir:-/home/ziad-gebril/Desktop/Anti Vairus/malicious_dir}"
interval="${interval:-5}"

interval="2"
malicious_ex=(".exe" ".bat" ".vbs" ".scr" ".ps1")
malicious_cont=("virus" "trojan" "malware" "worm" "ransomware")


info_new="directory-info.new"
info_last="directory-info.last"

scan() {
    while true; do
    ls -l "$dir" > "$info_new"
    echo "scanning: $dir"
    for file in "$dir"/*; do
        [ -f "$file" ] || continue

        fname=$(basename "$file")
        echo $fname
    done

    cp "$info_new" "$info_last"
    sleep "$interval"

    done
}

scan