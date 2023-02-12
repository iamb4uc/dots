#     ███████████  █████████  █████   █████ ███████████     █████████ 
#    ░█░░░░░░███  ███░░░░░███░░███   ░░███ ░░███░░░░░███   ███░░░░░███
#    ░     ███░  ░███    ░░░  ░███    ░███  ░███    ░███  ███     ░░░ 
#         ███    ░░█████████  ░███████████  ░██████████  ░███         
#        ███      ░░░░░░░░███ ░███░░░░░███  ░███░░░░░███ ░███         
#      ████     █ ███    ░███ ░███    ░███  ░███    ░███ ░░███     ███
#  ██ ███████████░░█████████  █████   █████ █████   █████ ░░█████████ 
# ░░ ░░░░░░░░░░░  ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░   ░░░░░   ░░░░░░░░░  
                                                                    
# A fucking horrible and obsurdly fast zsh config inspired by Luke smith's void rice's zsh config
# No need for soy Oh-my-zsh shit
# Github: iamb4uc

# Enable colors and change prompt:
autoload -U colors && colors
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b  "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
# PROMPT="%m %F{222} %f "
# RPROMPT="%d"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# Settings
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# End of lines added by compinstall
#
#################
## Keybindings ##
#################
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -s '^f' 'fzf\n'
#############
## Aliases ##
#############
# Quick one liners for big-ass commands.
#
# File navigations
alias l=lsd
alias la="lsd -a"
alias lt="lsd --tree"
alias ll="lsd -l" 
alias lla="lsd -la"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
#
# Applications
alias v=$EDITOR
alias lf=lfub
alias nf=neofetch
alias wal=nitrogen
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias cat=bat
alias sudo=doas
alias up="uptime -p"
alias conf="lfcd ~/.config"
alias untar="tar -xvzf"
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias em="emacsclient -c -a 'emacs'"
#
# Git
alias gup="git pull"
alias gad="git add "
alias gcom="git commit -m "
alias gcl="git clone --recurse-submodules"
alias gpush="git push"
alias gstat="git status"
#
# Compile(usefull with MAKEFILES)
alias mc="doas make clean"
alias mci="doas make clean install"
alias mk="make"
#
# Package manager
# 
# Pacman
# Commands are normally in the form of "pac"<the command>
# eg. pacrem: removes packages, pacin: install packages
alias pacin="doas pacman -S --color=always"
alias paccln="doas pacman -Sc --color=always"
alias pacsnc="doas pacman -Sy --color=always"
alias pacser="doas pacman -Ss --color=always"
alias pacup="doas pacman -Syu --color=always"
alias pacrem="doas pacman -Rsn --color=always"
# 
# AUR(yay)
alias yain="yay -S"
alias yacln="yay -Sc"
alias yastat="yay -Ps"
alias yaser="yay -Sc"
#
# XBPS
alias xi="doas xbps-install -S"
alias xq="doas xbps-query"
alias xr="doas xbps-remove"
alias xrc="doas xbps-remove -RcOo"
alias xrr="doas xbps-remove -ROo"
alias xu="doas xbps-install -Su"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #bg0
    echo -en "\e]P8928374" #grey
    echo -en "\e]P1cc241d" #darkred
    echo -en "\e]P9fb4934" #red
    echo -en "\e]P298971a" #darkgreen
    echo -en "\e]PAb8bb26" #green
    echo -en "\e]P3d79921" #darkyellow
    echo -en "\e]PBfabd2f" #yellow
    echo -en "\e]P4458588" #darkblue
    echo -en "\e]PC83a598" #blue
    echo -en "\e]P5b16286" #darkmagenta
    echo -en "\e]PDd3869b" #magenta
    echo -en "\e]P6689d6a" #darkcyan
    echo -en "\e]PE8ec07c" #cyan
    echo -en "\e]P7a89984" #fg4
    echo -en "\e]PFebdbb2" #fg1
    clear #for background artifacting
fi
