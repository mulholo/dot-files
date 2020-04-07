lf="lsof -i :"
cpr="cd ~/proj/"
dif="git diff"
sta="git status"
current-branch="git rev-parse --abbrev-ref HEAD"
v="nvim"
zshrc="nvim ~/.zshrc"
vimrc="nvim ~/.vimrc"
pom="noti ~/pomodoro"
ngrok="~/ngrok"
stik="nvim ~/.stik.md"
# Show current requested and assigned PRS
prs="hub pr list --state=open --format='%pC%>(8)%i%Creset %t %n   Author: %au | Requested: %rs %n   URL: %U %n%n' --limit=200 --sort=long-running | grep --color='never' --context=2 -E 'mulholio'"
# Memrise
wa-up="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml up"
wa-down="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml down"
dc="cd ~/proj/memrise && docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml -f meme/docker-compose-dev.yml -f cas/docker-compose-dev.yml" # args go after here
get-coverage="yarn test:coverage && open coverage/lcov-report/index.html"

# feck - fuzzy checkout
# Use FZF to search all branches and checkout immediately
feck="git branch | fzf | xargs git checkout"
# copy current branch name to clipboard
bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"
ctags="`brew --prefix`/bin/ctags"
