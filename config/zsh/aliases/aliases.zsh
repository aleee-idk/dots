#--------------------------------------------------------------------#
#                              Aliases                               #
#--------------------------------------------------------------------#

#fix obvious typo's
alias pdw="pwd"

#search content with ripgrep
alias rg="rg --sort path"

# move stuff arround
alias \
    cp='cp -iv' \
    mv='mv -iv' \
    cpr='rsync  -za --partial -hh --info=progress2' \
    mvr='rsync  -za --remove-source-files --partial -hh --info=progress2' \
    sync='rsync -zau --delete --partial -hh --info=progress2' \
    md='mkdir -pv';

# delete stuff
alias \
    rm='trash -i' \
    rmf='rm -rfI'

# short long and common commands
alias \
    mkexec='chmod +x';

# Exa for listing
alias \
    ls='exa -lh --color=always --icons --git ' \
    la='exa -alh --color=always --icons --git ' \
    ld='exa -la --no-permissions --no-filesize --no-time --no-time --no-user'

# Pacman
alias \
    pkgu="paru -Syu --removemake --cleanafter --sudoloop --color always" \
    pkgi="paru --skipreview --removemake --cleanafter --sudoloop --color always --needed" \
    pkgr="paru -R" \
    cleanup='sudo pacman -Rns $(pacman -Qtdq)' \
    pkglast="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -25 | nl"


alias \
    reload='exec $SHELL -l' \

    # Query Stuff
alias \
    ip='ip -human -color -brief addr' \
    df="duf --hide special --hide-mp '/boot,/boot/*'" \
    du='dust --reverse' \
    du1='dust --reverse --min-size 1M --depth 1' \
    du2='dust --reverse --min-size 1M --depth 2' \
    du3='dust --reverse --min-size 1M --depth 3' \
    cat='bat';

## Music Streams
lofi_url="https://youtu.be/jfKfPfyJRdk"
nintendo_url="https://www.youtube.com/c/Henriko/live"
alias \
    music-lofi='mpv "$lofi_url" &>/dev/null &!' \
    music-lofi-bg='ts lofi -d "mpv --no-video $lofi_url"' \
    music-ninten='mpv "$nintendo_url" &>/dev/null &!' \
    music-ninten-bg='ts lofi -d "mpv --no-video $nintendo_url"'

#--------------------------------------------------------------------#
#                               Global                               #
#--------------------------------------------------------------------#

alias -g NULL='> /dev/null 2>&1'
