set -x PATH /usr/local/bin $PATH
set -U FZF_LEGACY_KEYBINDINGS 0

# nodebrew PATH
set -x PATH /usr/local/var/nodebrew/current/bin $PATH
set -x PATH ~/.nodebrew/current/bin $PATH

# GO
set -x GOPATH $HOME/go $GOPATH
set -x PATH $HOME/go/bin $PATH
set -x GO111MODULE on

#rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
status --is-interactive; and source (rbenv init -|psub)
set -l NEWPATH
for p in $PATH
  if not contains $NEWPATH $p
    set NEWPATH $NEWPATH $p
  end
end
set PATH $NEWPATH

alias v="env nvim"
alias vf="env nvim ~/.config/fish/config.fish"

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
