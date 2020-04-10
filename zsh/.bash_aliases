alias cpr="cd ~/proj/"
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias pom="noti ~/pomodoro"
alias ngrok="~/ngrok"
# Show current requested and assigned PRS
alias prs="hub pr list --state=open --format='%pC%>(8)%i%Creset %t %n   Author: %au | Requested: %rs %n   URL: %U %n%n' --limit=200 --sort=long-running | grep --color='never' --context=2 -E 'mulholio'"
# copy current branch name to clipboard
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
