. ~/dotfiles/git-prompt.sh
. ~/.bash_local
alias v='vim'
alias nv='nvim'

alias pc='pbcopy <'
alias l='ls -ltr'
alias la='ls -a'
alias ll='ls -l'

# git
alias g='git'
alias gs='git status -sb'
alias gco='git checkout'
alias gp='git pull'
alias gd='git diff'
alias gl='git log --graph --date=short'
alias ga='git add'
alias gc='git commit -m'

# docker
alias dk='docker'
alias dc='docker compose'
alias dcp='docker compose ps'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -d /usr/share/bash-completion ] && source /usr/share/bash-completion/bash_completion

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
_fzf_ghq() {
  local repo
  repo=$(ghq list | fzf-tmux)
  cd $(ghq root)/$repo
}
bind -x '"\C-g": _fzf_ghq'

_fzf_history() {
  local output
  output=$(history | sed 's/ *[0-9]* *//' | awk '!a[$0]++' | fzf-tmux)
  READLINE_LINE=$output
  READLINE_POINT=0x7fffffff
}
bind -x '"\C-r": _fzf_history'

export PS1='\[\e[0;36;49m\]uji\[\e[0;39;49m\]:\w \[\e[0;32;49m\]$(__git_ps1 "%s")\[\e[0;36;49m\] $\[\e[0;39;49m\] '
