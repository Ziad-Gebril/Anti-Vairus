#!/bin/bash


dir="${dir:-/home/ziad-gebril/Desktop/Anti Vairus/dir}"
malicious_dir="${malicious_dir:-/home/ziad-gebril/Desktop/Anti Vairus/malicious_dir}"
interval="${interval:-5}"

interval="10"
malicious_ex=("exe" "bat" "vbs" "scr" "ps1")
malicious_key=("virus" "trojan" "malware" "worm" "ransomware")

main(){
    i=0

    for file in "$malicious_dir"/*; do
            [ -f "$file" ] || continue
            ((i++))
            fname=$(basename "$file")
            echo $i- $fname

    done

    if [ $i == 0 ]; then
        echo "No Milicious Files to take Action on"
    else
        echo "Choose file: "
        read variable
        action $variable
    fi
}


restore(){
    clear
    local x="$1"
    local i=1
    for file in "$malicious_dir"/*; do
        if [ "$i" == "$x" ]; then
            mv "$file" "$dir/"            
            echo "Restored <$file> to <$dir>"
            break
        else
            ((i++))
        fi
    done
}


delete(){
    clear
    local x="$1"
    local i=1
    for file in "$malicious_dir"/*; do
        if [ "$i" == "$x" ]; then
            rm "$file"            
            echo "<$file> permanently deleted."
            break
        else
            ((i++))
        fi
    done
}

action(){
    clear
    local x="$1"
    echo "1- Restore"
    echo "2- Delete"
    echo "3- Back"
    echo "Choose action: "
    read variable

    case "$variable" in
    "1")
        restore $x
        main
        ;;
    "2")
    
        delete $x
        main
        ;;
    "3")
        clear
        main
        ;;
    *)
        echo "invalid choice"
        event $x
        ;;
esac
}

main