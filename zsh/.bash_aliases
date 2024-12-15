alias cpr="cd ~/proj/"
alias y="yarn"
alias g="git"
alias gs="git status"
alias y="yarn"
alias v="nvim"
alias yw="yarn workspace"
# copy current branch name to clipboard
alias curbranch="git rev-parse --abbrev-ref HEAD"
alias bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"
# feck - fuzzy checkout
alias feck="git branch | fzf | xargs git checkout"
alias '??'="gh copilot suggest -t shell"
alias 'git?'="gh copilot suggest -t git"
alias 'gh?'="gh copilot suggest -t gh"
alias 'ls'='eza -l -h --git'
