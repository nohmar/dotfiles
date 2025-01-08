export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

export KEYTIMEOUT=1
export REPORTTIME=10

HISTFILE=${HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Enable IEx history
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

bindkey -v

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

path=(
  /usr/local/{bin,sbin}
  ${HOME}/bin
  $path
)

# Allow commands to pass through to applications
stty -ixon

source ~/.zsh/prompt.zsh
source ~/.zsh/utils.zsh

fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh

compctl -g '~/.teamocil/*(:t:r)' teamocil

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
