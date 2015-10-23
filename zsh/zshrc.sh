# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#unsetopt correct_all 
unsetopt CORRECT #turn off zsh correct prompt
# unalias rm #get rid of rm prompt inserted by prezto

alias secret="vim ~/.secret_config"
HISTIGNORE="jrnl *"

# ZSH config Aliases
alias zshconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zshreload="source ~/.zshrc; echo sourcing zshrc!"
alias zreload="source ~/.zshrc; echo sourcing zshrc!"
alias reload="source ~/.zshrc; echo sourcing zshrc!"
alias vconfig="vim ~/dotfiles/vim/vimrc.vim"
alias tconfig="vim ~/dotfiles/tmux/tmux.conf"
alias nconfig="vim ~/dotfiles/nosetests/noserc"

alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias vi="vim"

export VISUAL=vim
export EDITOR="$VISUAL"


#Misc Aliases
alias celar="clear"
alias c="clear"
alias video="sudo killall VDCAssistant"
alias c='pygmentize -O style=monokai -f console256 -g'
alias disable_ethernet="sudo ifconfig en0 down"
alias enable_ethernet="sudo ifconfig en0 up"
alias work="cd ~/dev/clubs"
alias dots="cd ~/dotfiles"
alias scratch="vim ~/practice/python/scratch.py"

##PATH
PATH="/usr/local/share/npm/bin:$PATH"                      # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                        # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"      # Coreutils
PATH="$HOME/.rbenv/bin:$PATH"                              # RBENV

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # Manual pages


eval "$(rbenv init -)" #for RBENV

# =================
# Settings
# =================

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

# =================
# History
# =================

# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history


# ====================
# Aliases
# ====================
alias run='python manage.py runserver --env mydev'
alias runforbes='python manage.py runserver --site forbes --env mydev'
alias rebuild='python manage.py rebuilddb --env mydev'
alias pag='ag --python --pager=less'
alias jag='ag --jade --pager=less'
alias cag='ag --coffee --pager=less'
alias tag='ag -G test --pager=less'

# show slashes for directories.
alias ls='ls -F'

alias history='history 0' 

alias chrome='open -a "Google Chrome"'

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi



if  test "$HOST" = "Collins-MacBook-Air.local" || test "$HOST" = "Collins-Air.home"  || test "$HOST" = "Collins-Air.fios-router.home"; then
    # =================
    # if personal computer
    # =================
    printf '%s\n' "On MacBook Air --> $HOST"
    source ~/dotfiles/zsh/personal_computer.sh
else
    # =================
    # if work computer
    # =================
    printf '%s\n' "on work computer"
    source ~/dotfiles/zsh/work_computer.sh
fi

# =================
# Functions
# =================

function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }

function firefox() { open -a /Applications/Firefox.app/ "http://www.google.com/search?q= $1"; }

function collin() {
    ls /usr/local/bin/collin/

}

function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

function run_clubs_tests() {
    for f in ~/dev/clubs/clubs/tests/*; do 
        # if [ $f = *test* ] 
        # then
        #     echo $f
            echo "========================="
            echo "Running tests for $f"; 
            nosetests $f; 
            echo "========================="
    # else
    #     echo "no"
    #     fi
    done
}

alias nn=run_clubs_tests
