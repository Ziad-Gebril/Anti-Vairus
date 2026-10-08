
clear
malicious_dir="${malicious_dir:-/home/ziad-gebril/Desktop/Anti Vairus/malicious_dir}"


action(){
    
    local x="$1"
    echo "1- Run antivirus"
    echo "2- Run restore"
    echo "3- make milicious directory"
    echo "Choose action: "
    read variable

    case "$variable" in
    "1")
        clear
        ./antivirus.sh
        ;;
    "2")
        clear
        ./restore.sh
        ;;
    "3")
        clear
        if [ -d "$malicious_dir" ]; then
            echo "The quarantine directory already exists"
        else
            echo "The quarantine directory was created successfully"
            mkdir -p "$malicious_dir"
        fi
        action
        ;;
    *)
        echo "invalid choice"
        event $x
        ;;
esac
}

action