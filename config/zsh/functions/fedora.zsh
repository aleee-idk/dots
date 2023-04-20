dnf-save-install() {
    file="$DOTS/exports/dnf.txt"
    echo "$*" >> "$file"
    sort -u -o "$file" "$file"
    sudo dnf install -y $(cat "$DOTS/exports/dnf.txt")
}

upgrade() {
    sudo dnf upgrade --refresh -y
}

mayor-upgrade() {
    if [[ $(dnf check-update -q) ]]; then
        echo "There are updates pending, update and reboot? [y/N]"
        read -r answer

        if [[ $answer == 'y' || $answer == 'Y' ]]; then
            upgrade
            sc-reboot

        fi
    fi
}
