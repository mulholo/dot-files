alias v="nvim"
alias cpr="cd ~/proj/"
alias zshrc="nvim ~/.zshrc"
alias pom="noti ~/pomodoro"
alias ngrok="~/ngrok"
alias g="git"
# copy current branch name to clipboard
alias curbranch="git rev-parse --abbrev-ref HEAD"
alias bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"

# feck - fuzzy checkout
# ---------------------
# Use FZF to search all branches and checkout immediately
alias feck="git branch | fzf | xargs git checkout"

# Memrise
# -------
alias waup="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml up"
alias wadown="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml down"
alias dc="cd ~/proj/memrise && docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml -f meme/docker-compose-dev.yml -f cas/docker-compose-dev.yml" # args go after here
alias getcov="yarn test:coverage && open coverage/lcov-report/index.html"
alias mkpr="gh pr create -t $(curbranch)"
