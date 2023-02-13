#--------------------------------------------------------------------#
#                              Aliases                               #
#--------------------------------------------------------------------#

#fix obvious typo's
alias pdw="pwd"

#search content with ripgrep
alias rg="rg --sort path"

# prompt and do verbose
alias \
    cp='cp -iv' \
    mv='mv -iv' \
    rm='rm -iv' \
    md='mkdir -pv';

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
    df='df -h'

## Music Streams
lofi_url="https://youtu.be/jfKfPfyJRdk"
nintendo_url="https://youtu.be/Ns_uXoOJ7iw"
alias \
    music-lofi='celluloid "$lofi_url" &>/dev/null &!' \
    music-lofi-bg='ts lofi -d "mpv --no-video $lofi_url"' \
    music-ninten='celluloid "$nintendo_url" &>/dev/null &!' \
    music-ninten-bg='ts lofi -d "mpv --no-video $nintendo_url"'

#--------------------------------------------------------------------#
#                               Global                               #
#--------------------------------------------------------------------#

alias -g NULL='> /dev/null 2>&1'
