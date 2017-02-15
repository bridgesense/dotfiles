#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
export EDITOR=vim

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

if [ -f ~/.yadrlite/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.yadrlite/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Makes Ranger exit in the directory you quit from
if (( $+commands[ranger] )); then
    alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
fi

# Load additional user defined plugins
if [ -f ~/.zshrc.plugins ]; then
    source ~/.zshrc.plugins
fi

if [ -f ~/.yadrlite/zsh/plugin/pure/async.zsh ]; then
    source ~/.yadrlite/zsh/plugin/pure/async.zsh
    source ~/.yadrlite/zsh/plugin/pure/pure.zsh
fi
autoload -U colors && colors
setopt promptsubst
PROMPT='%{%F{136}%}... %{$reset_color%}'
