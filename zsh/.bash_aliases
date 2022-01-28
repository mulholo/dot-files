alias v="nvim"
alias cpr="cd ~/proj/"
alias zshrc="nvim ~/.zshrc"
alias g="git"
# copy current branch name to clipboard
alias curbranch="git rev-parse --abbrev-ref HEAD"
alias bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"
# feck - fuzzy checkout
alias feck="git branch | fzf | xargs git checkout"
# Use FZF to fuzzy add files to git
alias fza="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add -p"
alias ls="exa -l"
