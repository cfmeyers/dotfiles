# ============== #
# Prezto Configs #
# ============== #
setopt EXTENDED_GLOB #for Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
unsetopt CORRECT #turn off zsh correct prompt


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
alias work="cd ~/dev/clubs"
alias dots="cd ~/dotfiles"
alias dt="cd ~/Desktop"
alias desk="cd ~/Desktop"
alias secret="vim ~/.secret_config"
alias scratch="vim ~/scratch.py"

# ========= #
# PATH mods #
# ========= #
PATH="/usr/local/share/npm/bin:$PATH"                # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"          # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                   # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # Coreutils
PATH="$HOME/.rbenv/bin:$PATH"                        # RBENV
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # Manual pages

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
HISTIGNORE="jrnl *"


# ============ #
# Data Science #
# ============ #
alias aipython="~/anaconda/bin/ipython"
alias apython="~/anaconda/bin/python"
alias notebook="~/anaconda/bin/ipython notebook"

# ============ #
# Work Aliases #
# ============ #
alias run='python manage.py runserver --env mydev'
alias runforbes='python manage.py runserver --site forbes --env mydev'
alias runshell='python manage.py shell --env mydev'
alias runcelery='python run_celery.py worker --env mydev '
alias celery='runcelery'
alias rebuild='python manage.py rebuilddb --env mydev'

alias nt='echo Started Tests at `date +%k:%M`; nosetests --with-id'
alias n='nosetests'
alias fo='nosetests --failed'

alias importvintage='python manage.py import_vintage_attributes /tmp/WineData.csv --env mydev'
alias regen='python manage.py assets clean --env mydev; python manage.py assets build --env mydev'

alias lcron='ssh collin@54.146.75.138' # (l18-cron)
alias lweb1='ssh collin@54.197.114.72' # (l18-web-01)
alias lweb2='ssh collin@54.157.141.44' # (l18-web-02)

# ========== #
# Ag Aliases #
# ========== #
alias pag='ag --python --pager=less'
alias jag='ag --jade --pager=less'
alias cag='ag --coffee --pager=less'
alias tag='ag -G test --pager=less'

alias tags_clubs_libs='ctags -R -f .virtualenvs/clubs/lib/python2.7/tags .virtualenvs/clubs/lib/python2.7/'
alias tags_clubs='ctags -R -f ~/dev/clubs/.git/tags ~/dev/clubs/'

alias h='history | grep'
# ===== #
# rbenv #
# ===== #
eval "$(rbenv init -)" #for RBENV
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

# ========= #
# Functions #
# ========= #

function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }

function firefox() { open -a /Applications/Firefox.app/ "http://www.google.com/search?q= $1"; }

function mkcd () { mkdir -p "$*"; cd "$*" }

function fixredis ()
{
    echo "fixing redis";
    find . -name "*.pyc" -type f -delete
    echo "CACHE_TYPE = 'simple'" >> ~/dev/clubs/clubs/config/common.py;
    echo "redis stuff fixed";

}
function unfixredis ()
{
    echo "unfixing redis";
    git co ~/dev/clubs/clubs/config/common.py;
    echo "redis unfixed";

}
