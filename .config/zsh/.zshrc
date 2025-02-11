#     ███████████  █████████  █████   █████ ███████████     █████████ 
#    ░█░░░░░░███  ███░░░░░███░░███   ░░███ ░░███░░░░░███   ███░░░░░███
#    ░     ███░  ░███    ░░░  ░███    ░███  ░███    ░███  ███     ░░░ 
#         ███    ░░█████████  ░███████████  ░██████████  ░███         
#        ███      ░░░░░░░░███ ░███░░░░░███  ░███░░░░░███ ░███         
#      ████     █ ███    ░███ ░███    ░███  ░███    ░███ ░░███     ███
#  ██ ███████████░░█████████  █████   █████ █████   █████ ░░█████████ 
# ░░ ░░░░░░░░░░░  ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░   ░░░░░   ░░░░░░░░░  
                                                                    
# A fucking horrible yet obsurdly fast zsh config inspired by Luke smith's void rice's zsh config
# Github: iamb4uc

autoload -U colors && colors
PROMPT="%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[green]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b  "
# PROMPT="%B%{$fg[white]%}%n%{$fg[red]%} ▶️ %{$fg[yellow]%}%M:%{$fg[green]%} %~%{$reset_color%}$%b  "
# RPROMPT="%B%t%b"

HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v                                                      # Vim Keybindings -e for soymacs

autoload -Uz compinit                                           # Completion
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
zstyle ':completion:*' cache-path $HOME/.cache/zsh/.zshcomp

# Settings
setopt autocd                                                   # Automatically cd into typed directory.
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


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
bindkey -s '^f' "fzf | xargs 'nvim'\n"
bindkey -s '^n' 'mkdir -p '
bindkey -s '^c' 'cp -r '


#############
## Aliases ##
#############
# Quick one liners for big-ass commands.
# File navigations
alias l=exa
alias ls=exa
alias la="exa -a"
alias lt="exa --tree"
alias ll="exa -l" 
alias lla="exa -la"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias rm="rm -rf" # Cause why not

# Applications
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias e=$EDITOR
alias lf=lfub
alias du=dust
alias nf="neofetch"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias cat=bat
alias sudo=doas
alias up="uptime -p"
alias econ="nvim ~/.config/."
alias untar="tar -xvzf"
alias yt="yt-dlp --add-metadata -i"
alias yta="yt --audio-format flac"
alias peaclock="peaclock --config-dir ~/.config/peaclock"
alias wal="lf $WALLPAPERS"
alias spotdl="spotdl --output-format flac"
alias rawtojpg="find . -type f \( -iname '*.raw' -o -iname '*.nef' \) -exec sh -c 'darktable-cli {} ${0%.*}.jpg' {} \; -delete" # Converts RAW/NEF file(s) to JPG and removes the original NEF file(s) as per https://askubuntu.com/a/1337782
alias snc="rsync -avP --partial"
alias btc="bluetoothctl"
alias screc="ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -c:v libx264 -i :0.0" # You have to provide the file name along with this alias
alias pyenv="source .env/bin/activate"
#
# Git
alias gini="git init"
alias gstsh="git stash"
alias gdiff="git diff"
alias grm="git rm -rf"
alias gpull="git pull"
alias gad="git add"
alias gcom="git commit -m"
alias gcl="git clone --recurse-submodules"
alias gpush="git push"
alias gstat="git status"
alias glogo="git log --oneline"
alias gao="git remote add origin"

# Tmux
alias t="tmux"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias tks="tmux kill-server"
alias ts="tmux source $HOME/.config/tmux/tmux.conf"
#
# Compile(usefull with suckless MAKEFILES)
alias mc="doas make clean"
alias mci="doas make install"
alias mk="make"
#
# Package managers
# 
# Pacman
alias pacin="doas pacman -S --color=always"
alias paccln="doas pacman -Sc --color=always"
alias pacsync="doas pacman -Sy --color=always"
alias pacsrch="doas pacman -Ss --color=always"
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
alias xq="xbps-query"
alias xql="xbps-query -l"
alias xi="doas xbps-install -S"
alias xr="doas xbps-remove"
alias xrc="doas xbps-remove -RcOo"
alias xrr="doas xbps-remove -ROo"
alias xu="doas xbps-install -Su"
#
# APT/APT-GET (idk much about apt package manager) (make pull request if you know about these commands.) 
# TODO make more aliases for apt package manager
alias aptup="doas apt-get update"
alias aptug="doas apt-get upgrade"
alias aptin="doas apt-get install"
alias dpkin="doas dpkg -i"


alias ssconnect="doas openvpn"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
