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
PROMPT="%m %F{222}➔ %f "
RPROMPT="%d"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)



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
#
# Applications
alias v=nvim
alias vim=nvim
alias lf=lfub
alias nf=neofetch
alias wal=nitrogen
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias cat=bat
alias sudo=doas
alias up="uptime -p"
alias conf="lfcd ~/.config"
#
# Git
alias gup="git pull"
alias gad="git add "
alias gcom="git commit -m "
alias gcl="git clone --recurse-submodules"
alias gpush="git push"
alias gstat="git status"
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
alias xrr="doas xbps-remove -ROo"
alias xu="doas xbps-install -Suv"
# 
# Edit file shortcuts
alias n="$EDITOR ~/.config/nvim/init.lua"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# eval "$(starship init zsh)"
