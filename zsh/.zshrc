#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
export PATH=$HOME/.local/bin/lvim:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt appendhistory
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

#solarized autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

alias v="$HOME/.local/bin/lvim"
alias i3="v ~/.config/i3/config"
alias ls="exa --long --grid -a"
alias snd="setxkbmap -layout us -option ctrl:swap_rwin_rctl && setxkbmap -layout us -option ctrl:nocaps"
alias hama="setxkbmap -layout us -option ctrl:swap_ralt_rctl && setxkbmap -layout us -option ctrl:nocaps"
alias ctrl="setxkbmap -layout us -option ctrl:nocaps"
#task 

alias t="task"
alias ta="task add"

#redshift
alias red="pkill -USR1 redshift"

#hev
alias xev="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'"

# monitor options
alias right="xrandr --output HDMI-1 --rotate right"
alias off="xrandr --output eDP-1 --off"

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select

# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist

# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "marlonrichert/zsh-autocomplete"
zsh_add_completion "esc/conda-zsh-completion" true
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# FZF 
# TODO update for mac
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# TODO Remove these
xset r rate 210 40

# Speedy keys
xset r rate 210 40

# Environment variables set everywhere
export EDITOR="/home/miroslav/.local/bin/lvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# For QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct

#ctrl remaps
setxkbmap -layout us -option ctrl:nocaps
