. ~/dotfiles/git-prompt.sh
. ~/.bash_local
alias v='vim'

alias l='ls -ltr'
alias la='ls -a'
alias ll='ls -l'

# git
alias g='git'
alias gs='git status -sb'
alias gch='git checkout'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga='git add'
alias gc='git commit'

# docker
alias d='docker'
alias dc='docker compose'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

# cd dir by fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# git checkout by fzf
fch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# git remote checkout by fzf
fchr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# docker exec bash by fzf
dbash() {
  local name
  name=$(docker ps --format "{{.Names}}" | fzf-tmux)
  docker exec -it $name bash
}

# cd git repository by fzf
fghq() {
  local repo
  repo=$(ghq list | fzf-tmux)
  cd $(ghq root)/$repo
}

PS1_USER="\[\e[1;39;46m\] \h "
PS1_DIR="\[\e[1;39;44m\] \W "
PS1_GIT='\[\e[1;39;46m\]$(__git_ps1 " %s ")'
PS1_BLUE="\[\e[0;34;49m\] $ "
PS1_WHITE="\[\e[0;39;49m\]"
export PS1=$PS1_USER$PS1_DIR$PS1_GIT$PS1_BLUE$PS1_WHITE
