SEPARATOR=" │ "
FZF_SEPARATOR="│" # Same character, without whitespaces

format_values() {
    values="$1"
    shift
    divider="$1"
    shift
    echo -e "$(echo "$values" | column --table --separator $divider --output-separator $SEPARATOR)"
}

tmux_switch_or_create() {
    target=$1
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"

    tmux $change -t "$target" 2>/dev/null || (tmux new-session -d -s $target && tmux $change -t "$target"); return
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0 --select-1) &&  tmux $change -t "$session" || echo "No sessions found."
}

ta() {
    export START_DIRECTORY="$(z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"

    if [[ -z START_DIRECTORY ]]; then
        exit 0
    fi

    export SESSION_NAME="$(basename $START_DIRECTORY)"

    tmuxp load $(fd -e yml . ~/.config/tmuxp | fzf)
}
