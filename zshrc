#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

#autoload -Uz compinit
#compinit
autoload -U colors && colors
setopt promptsubst
# End of lines added by compinstall

source ~/.dotsense/zsh/plugin/zsh-git-prompt/zshrc.sh
PROMPT='$fg[cyan]%m: %F{136}%~$reset_color $(git_super_status): '
