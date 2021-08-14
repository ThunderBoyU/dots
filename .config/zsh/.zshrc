# The following lines were added by compinstall

autoload -U colors && colors
PS1="%F{blue}%m%f %~ " 
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b " # Luke's prompt

stty stop undef

#zstyle ':completion:*' completer _complete _ignored
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
#zstyle :compinstall filename '/home/thunder/.config/zsh/.zshrc'

# Automatically quote globs in URL and remote references
__remote_commands=(scp rsync)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema '[[ $__remote_commands[(i)$words[1]] -le ${#__remote_commands} ]] && reply=("*") || reply=(http https ftp)'

autoload -U compaudit compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
unset CASE_SENSITIVE HYPHEN_INSENSITIVE
zmodload zsh/complist
_comp_options+=(globdots)

# I don't want all the bloat from oh-my-zsh, but the completion functions are good.

source $ZDOTDIR/lib/*.zsh
compinit
HISTFILE=~/.config/zsh/histfile
HISTSIZE=100000000
SAVEHIST=100000000

# Shell options

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
unsetopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
unsetopt autocd
bindkey -v

# Bindings

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#    _    _     ___    _    ____  _____ ____
#   / \  | |   |_ _|  / \  / ___|| ____/ ___|
#  / _ \ | |    | |  / _ \ \___ \|  _| \___ \
# / ___ \| |___ | | / ___ \ ___) | |___ ___) |
#/_/   \_\_____|___/_/   \_\____/|_____|____/
 
alias ls="ls --color"
alias a="clear && afetch"

alias mpv="noglob mpv"
alias ytdl="noglob youtube-dl"
alias youtube-dl="noglob youtube-dl"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# STARTUP
a
