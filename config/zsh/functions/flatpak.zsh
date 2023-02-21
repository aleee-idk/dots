export FLATPAK_ALIAS_FILE="${DOTS:-$HOME/.config}/config/zsh/aliases/flatpak.zsh"
export FLATPAK_EXPORT_FILE="${DOTS:-$HOME/Desktop}/exports/flatpak-apps.txt"

fp() {
    set -e
    generate_flatpak_alias() {
        local flatpak_alias_file=${1:-$FLATPAK_ALIAS_FILE}
        [[ -f $flatpak_alias_file ]] && touch "$flatpak_alias_file"
        local flatpak_binaries_dir="/var/lib/flatpak/exports/bin"
        if [[ -d "$flatpak_binaries_dir" ]]; then
            echo -e "\n# Auto-generated aliases for Flatpak applications\n" >> "${flatpak_alias_file}"

            while read -r app; do
                app_id=$(echo "$app" | awk -F'/' '{print $NF}')
                alias_name=$(echo "$app_id" | awk -F'.' '{print $NF}' | tr '[:upper:]' '[:lower:]')
                echo "alias $alias_name='flatpak run $app_id'" >> "${flatpak_alias_file}"
            done < <(find "$flatpak_binaries_dir" -maxdepth 1 -mindepth 1)

            echo "Done generating Flatpak aliases"
            echo "Check ${BLD}${BLU}$flatpak_alias_file${RST} to modify auto-generated alias"
        else
            echo "${RED}${BLD}Error: ${YLW}$flatpak_binaries_dir${RST} directory does not exist"
        fi
    }

    export_flatpak_apps() {
        local flatpak_export_file=""${1:-$FLATPAK_EXPORT_FILE}
        flatpak list --columns=application --app > "${flatpak_export_file}"
        echo "${BLD}${BLU}Flatpak apps exported successfully${RST}"
    }

    import_flatpak_apps() {
        local flatpak_export_file=${1:-$FLATPAK_EXPORT_FILE}
        xargs flatpak install -y < "${flatpak_export_file}"
    }

    show_help() {
        echo -e "${BLD}Usage: ${GRN}fp${RST}${YLW} [OPTION]${RST}"
        echo -e ""
        echo -e "${BLD}  Options:${RST}"
        echo -e "${YLW}    -e, export      ${RST}Export a list of installed Flatpak apps to a file"
        echo -e "${YLW}    -i, import      ${RST}Install Flatpak apps from exported file"
        echo -e "${YLW}    -g, generate    ${RST}Generate aliases for all installed Flatpak apps"
        echo -e "${YLW}    -h, --help      ${RST}Show this help"
    }

    main() {
        local action=$1

        case $action in
            "generate"|"-g")
                echo -en "Enter the location to save the Flatpak alias file, \n(default: ${FLATPAK_ALIAS_FILE}): "
                read -r user_alias_dir
                if [[ -n "$user_alias_dir" ]]; then
                    FLATPAK_ALIAS_FILE="$user_alias_dir"
                fi

                generate_flatpak_alias "${FLATPAK_ALIAS_FILE}"
                ;;

            "export"|"-e")
                echo -en "Enter the location to save the Flatpak export file (default: ${FLATPAK_EXPORT_FILE}): "
                read -r user_export_file
                if [[ -n "$user_export_file" ]]; then
                    FLATPAK_EXPORT_FILE="$user_export_file"
                fi

                export_flatpak_apps "${FLATPAK_EXPORT_FILE}"
                ;;

            "import"|"-i")
                echo -en "Enter the location of the Flatpak export file to import (default: ${FLATPAK_EXPORT_FILE}): "
                read -r user_export_file
                if [[ -n "$user_export_file" ]]; then
                    FLATPAK_EXPORT_FILE="$user_export_file"
                fi

                import_flatpak_apps "${FLATPAK_EXPORT_FILE}"
                ;;
            "--help"|"-h")
                show_help
                ;;
            *)
                show_help
                ;;
        esac
    }
    main "$@"
}
