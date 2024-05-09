autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{13}%b%f%u%c%f"
zstyle ':vcs_info:*' stagedstr " %F{33}staged"
zstyle ':vcs_info:*' unstagedstr " %F{196}dirty"
precmd() { vcs_info }

local current_dir="~%f%b "

PROMPT='%F{39}%n@%F{210}%m ${vcs_info_msg_0_}
%F{6}%${current_dir}'

setopt prompt_subst
