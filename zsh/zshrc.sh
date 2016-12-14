source ~/.secret_config
# ============== #
# Prezto Configs #
# ============== #
setopt EXTENDED_GLOB #for Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
unsetopt CORRECT #turn off zsh correct prompt

export NO_FORCED_PIP_INSTALL=True

# ====================== #
# Config Editing Aliases #
# ====================== #
alias zreload="source ~/.zshrc; echo sourcing zshrc!"
alias reload="source ~/.zshrc; echo sourcing zshrc!"
alias zconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias vconfig="vim ~/dotfiles/vim/vimrc.vim"
alias tconfig="vim ~/dotfiles/tmux/tmux.conf"
alias nconfig="vim ~/dotfiles/nosetests/noserc"

# =============================== #
# Better Shell Experience Aliases #
# =============================== #
alias celar="clear"
alias c='pygmentize -O style=monokai -f console256 -g'
alias disable_ethernet="sudo ifconfig en0 down"
alias enable_ethernet="sudo ifconfig en0 up"
alias ls='ls -F' # show slashes for directories.
alias history='history 0' 
alias chrome='open -a "Google Chrome"'
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias vi="vim"


# ==================== #
# Quick Access Aliases #
# ==================== #
alias dots="cd ~/dotfiles"
alias desk="cd ~/Desktop"
alias secret="vim ~/.secret_config"

# ============= #
# Java Settings #
# ============= #
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home/

# ========= #
# PATH mods #
# ========= #
PATH="/usr/local/share/npm/bin:$PATH"                # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"          # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                   # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # Coreutils
PATH="$HOME/.rbenv/bin:$PATH"                        # RBENV
PATH="$HOME/scripts:$PATH"                        # my scripts
PATH="$PATH:$JAVA_HOME"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # Manual pages

eval "$(rbenv init -)"

# ======== #
# Settings #
# ======== #
export LC_ALL="en_US.UTF-8" # Prefer US English
export LANG="en_US" # use UTF-8
export VISUAL=vim
export EDITOR="$VISUAL"

# ======= #
# History #
# ======= #
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
setopt inc_append_history # Appends every command to the history file once it is executed
setopt share_history # Reloads the history whenever you use it


# ============ #
# Work Aliases #
# ============ #


# ========== #
# Ag Aliases #
# ========== #
alias pag='ag --python --pager=less'
alias jag='ag --jade --pager=less'
alias cag='ag --coffee --pager=less'
alias tag='ag -G test --pager=less'

alias h='history | grep'

# if  test "$HOST" = "Collins-MacBook-Air.local" || test "$HOST" = "Collins-Air.home"  || test "$HOST" = "Collins-Air.fios-router.home"; then
#     # =================
#     # if personal computer
#     # =================
#     printf '%s\n' "On MacBook Air --> $HOST"
#     source ~/dotfiles/zsh/personal_computer.sh
# else
#     # =================
#     # if work computer
#     # =================
#     printf '%s\n' "on work computer"
#     source ~/dotfiles/zsh/work_computer.sh
# fi

# ========= #
# Functions #
# ========= #

function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }

function firefox() { open -a /Applications/Firefox.app/ "http://www.google.com/search?q= $1"; }

function mkcd () { mkdir -p "$*"; cd "$*" }

# ================ #
# todo.txt configs #
# ================ #
# source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t
# alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/todo/todo.cfg'


# ================ #
# fzf stuff        #
# ================ #

# see https://github.com/junegunn/fzf/wiki/examples

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}
