#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

source ~/.yadrlite/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.yadrlite/zsh/plugin/pure/async.zsh
source ~/.yadrlite/zsh/plugin/pure/pure.zsh
autoload -U colors && colors
PROMPT='%{%F{136}%}%n: %{$reset_color%}'
