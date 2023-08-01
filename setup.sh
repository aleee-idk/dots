#!/usr/bin/env bash

# Main entrypoint for all the setup functions
# it's called "_main" so it's stay on top only...

set -e

REPO="git@codeberg.org:aleidk/dots.git"
DOTS="$HOME/Repos/Private/dots"
CONFIG="$HOME/.config"
BINS="$HOME/.local/bin"
THEMES="$HOME/.themes"
ICONS="$HOME/.local/share/icons"

dependencies=(chsh curl git jq nvim tar wget zsh)
check_dependencies() {
	for dependency in "${dependencies[@]}"; do
		if ! command -v "$dependency" >/dev/null; then
			echo -e "${RED}Error: ${YLW}'$dependency' ${RST}command not found. \nPlease install it first and try again."
			exit 1
		fi
	done
}

create() {
	local dir="$1"
	local dir_name
	dir_name="$(basename "$dir")"
	if [[ ! -d "$dir" ]]; then
		echo -e "Creating directory for ${BLD}${BLU}'$dir_name'${RST}..."
		mkdir -p "$dir" && sleep 0.3
	fi
}

backup() {
	local file="$1"
	local backup_file=${2:-$file.dots}

	if [[ -e "$file" ]] && [[ ! -e "$backup_file" ]]; then
		echo "Backing up ${BLD}${BLU}$file${RST} to ${BLD}${CYN}$backup_file${RST}..."
		cp -r "$file" "$backup_file" && sleep 0.3
	fi
}

symlink() {
	local dootsfile="$1" target_dir="$2"

	final_path="$target_dir/$(basename "$dootsfile")"
	backup_file=$final_path.dots

	if [[ -e "$final_path" ]] && [[ ! -L "$final_path" ]] && [[ ! -e "$backup_file" ]]; then
		echo "Backing up ${BLD}${BLU}$target_dir${RST} to ${BLD}${CYN}$backup_file${RST}..."
		mv "$final_path" "$backup_file" && sleep 0.3
	fi

	echo -e "Symlinking ${BLD}${BLU}$dootsfile${RST} to ${BLD}${GRN}$target_dir${RST}..."
	ln -sf "$dootsfile" "$target_dir" && sleep 0.3
}

setup() {
	if [ ! -d "$DOTS" ]; then
		echo "Fetching Dots from the source..."
		create "$DOTS" && cd "$_" || return
		git clone --recurse-submodules "$REPO" "$(pwd)"
		source "$DOTS/config/zsh/config/colors.zsh" && define_colors
		# backup files first
		dirs=("$CONFIG" "$BINS" "$THEMES" "$ICONS")
		for dir in "${dirs[@]}"; do
			backup "$dir"
			create "$dir"
		done

		# execute install scripts
		./setup.sh

		# bat cache --build
		# recommended tools to install
		echo -e "${BLD}${BLU}All done.${WHT}\n\nRecommended tools to install:${RST}"
		source ./scripts/check-tools
	fi
}

main() {
	setup
	source "$DOTS/config/zsh/config/colors.zsh" && define_colors
	source "$DOTS/setup/config"
	source "$DOTS/setup/zsh"

	# for file in ./setup/*; do
	# shellcheck disable=all
	# source "$file"
	#	done
}

check_dependencies
main

# For custom installation comment out `stow_this config` from above, and
# uncomment this line of array below then remove some you don't want to include
# Note: Using stow will not work it will litter all the files in the target dir without their foldername/basename
# TODO: add colors, make this interactive, and split into multiple file?

# doots=(
#   alacritty
#   atuin
#   bat
#   broot
#   btop
#   cava
#   foot
#   fzf
#   git
#   gtk-3.0
#   gtk-4.0
#   hypr
#   kitty
#   librewolf
#   lsd
#   neofetch
#   nvim
#   ripgrep
#   tealdeer
#   tmux
#   zsh
# )
#
# for dot in "${doots[@]}"; do
#   cd "$DOTSFILES/config"
#   symlink "$(pwd)/$dot" "${CONFIG}"
# done
