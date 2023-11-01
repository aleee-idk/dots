#--------------------------------------------------------------------#
#                              Aliases                               #
#--------------------------------------------------------------------#

#fix obvious typo's
alias pdw="pwd"

# File Managment
alias \
    cp='cp -iv' \
    mv='mv -iv' \
    cpr='rsync  -za --partial -hh --info=progress2' \
    mvr='rsync  -za --remove-source-files --partial -hh --info=progress2' \
    sync='rsync -zau --delete --partial -hh --info=progress2' \
    del='trash -i' \
    rmf='rm -rfI' \
    md='mkdir -pv' \
    ls='exa -lh --color=always --icons --git ' \
    la='exa -alh --color=always --icons --git ' \
    ld='exa -la --no-permissions --no-filesize --no-time --no-time --no-user' \
    mkexec='chmod +x';

# Search and Query Files
alias grep="rg --sort path --context 3";

# Pacman
alias \
    pkgu="paru -Syu --removemake --cleanafter --sudoloop --color always" \
    pkgi="paru --skipreview --removemake --cleanafter --sudoloop --color always --needed" \
    pkgr="paru -R" \
    cleanup='sudo pacman -Rns $(pacman -Qtdq)' \
    pkglast="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -25 | nl"


# Query Stuff
alias \
    ip='ip -human -color -brief addr' \
    df="duf --hide special --hide-mp '/boot,/boot/*'" \
    du='dust --reverse' \
    du1='dust --reverse --min-size 1M --depth 1' \
    du2='dust --reverse --min-size 1M --depth 2' \
    du3='dust --reverse --min-size 1M --depth 3' \
    cat='bat';

# Misc
alias \
    reload='exec $SHELL -l' \

# Specific Mac overrides
if [[ "$OSTYPE" != 'linux-gnu' ]]; then
fi

#--------------------------------------------------------------------#
#                               Global                               #
#--------------------------------------------------------------------#

alias -g NULL='> /dev/null 2>&1'
