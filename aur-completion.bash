# Bash completion for aur helper
# Source this file or place it in bash_completion.d to enable `aur` completions.

_aur_completion()
{
    local cur prev words cword
    if ! _init_completion -n = 2>/dev/null; then
        words=("${COMP_WORDS[@]}")
        cword="${COMP_CWORD}"
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
    fi

    if [[ ${COMP_CWORD} -eq 1 ]];
    then
        local subcmds="fetch install update search inspect"
        COMPREPLY=( $(compgen -W "$subcmds" -- "$cur") )
        return 0
    fi

    prev="${COMP_WORDS[COMP_CWORD-1]}"
    local subcmd="${COMP_WORDS[1]}"

    case "$subcmd" in
        install)
            if [[ -n "$cur" ]]; then
                local results
                results=$(aur complete install "$cur" 2>/dev/null)
                COMPREPLY=( $(compgen -W "$results" -- "$cur") )
            fi
            ;;
        *)
            ;;
    esac
}

complete -F _aur_completion aur
