source ~/.profile.fish

alias v="env vim"
alias nv="env nvim"
alias vf="env vim ~/.config/fish/config.fish"

alias sf="env source ~/.config/fish/config.fish"
alias pc="env pbcopy <"
alias l="env ls -ltr"
alias la="env ls -a"
alias ll="env ls -l"
alias p="env python3"
alias pip="env pip3"

# git
alias g='env git'
alias gs='env git status -sb'
alias gco='env git checkout'
alias gp='env git pull'
alias gd='env git diff'
alias gl='env git log --graph --date=short --pretty=\"format:%C(yellow)%h %C(cyan)%ad %C(green)%an%Creset%x09%s %C(red)%d%Creset\"'
alias ga='env git add'
alias gc='env git commit -m'

# docker
alias dk="env docker"
alias dc="env docker-compose"
alias dcp="env docker-compose ps"

# rails
alias ra="env bin/rails"
alias ras="env bin/rails s"
alias rac="env bin/rails c"
alias rar="env bin/rails routes"
alias ram="env bin/rails db:migrate"
alias rasp="env bin/rspec"
