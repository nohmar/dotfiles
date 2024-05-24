alias p='cd ~/Projects/$(ls ~/Projects | fzf)'
alias pb='git checkout $(git branch --format="%(refname:short)" | fzf)'
