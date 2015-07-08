# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#unsetopt correct_all 
unsetopt CORRECT #turn off zsh correct prompt
# unalias rm #get rid of rm prompt inserted by prezto

alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -td $HOME/Dropbox/todo/todo.cfg' #Todo.txt alias
alias tls='clear; /usr/local/Cellar/todo-txt/2.10/bin/todo.sh -td $HOME/Dropbox/todo/todo.cfg ls' #


source ~/.secret_config
alias secret="vim ~/.secret_config"
HISTIGNORE="jrnl *"

# ZSH config Aliases
alias zshconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zshreload="source ~/.zshrc; echo sourcing zshrc!"
alias zreload="source ~/.zshrc; echo sourcing zshrc!"
alias reload="source ~/.zshrc; echo sourcing zshrc!"
alias vconfig="vim ~/dotfiles/vim/vimrc.vim"

alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias vi="vim"

alias transparent="echo -e '\033]50;SetProfile=TransparentCollin\a'"
alias tra="echo -e '\033]50;SetProfile=TransparentCollin\a'"
alias opaque="echo -e '\033]50;SetProfile=OpaqueCollin\a'"
alias op="echo -e '\033]50;SetProfile=OpaqueCollin\a'"

export VISUAL=vim
export EDITOR="$VISUAL"


#Misc Aliases
alias celar="clear"
alias c="clear"
alias video="sudo killall VDCAssistant"
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
alias snippets='~/.emacs.d/snippets'
alias c='pygmentize -O style=monokai -f console256 -g'

#TrueCrypt Aliases
#alias tc="/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text"
#alias tcm="tc --text --mount /Users/collin/Dropbox/MusicBackup/MusicBackup2 /Volumes/TrueCrypt"
#alias scribbles="cd /Volumes/TrueCrypt/scribbles/source/_posts"
#alias scrib="cd /Volumes/TrueCrypt/scribbles/source/_posts"
#alias sand="cd ~/dev/sand/source/_posts"

#Personal Script Aliases
#alias np="python ~/dev/scripts/octopress/newpost.py"
#alias phys="python ~/dev/scripts/octopress/newPhysicsPost.py"
#alias crypto="python ~/dev/scripts/octopress/newCryptographyPost.py"
#alias runs="python run.py runserver"
#alias get_backbone="bash ~/dev/scripts/bash/download_backbone_pack.sh"

#anaconda
#alias anip="/Users/collin/anaconda/bin/ipython"
#alias anp="/Users/collin/anaconda/bin/python"

##PATH

PATH="/usr/local/share/npm/bin:$PATH"                      # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                        # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"      # Coreutils
PATH="$HOME/.rbenv/bin:$PATH"                              # RBENV
# PATH="$HOME/anaconda/bin:$PATH"
# PATH="$PATH:/usr/local/Cellar/todo-txt/2.10/bin"          #Todo.txt

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
alias rebuild='python manage.py rebuilddb --env mydev'
alias pag='ag --python'
alias anki='vim /Users/collin/Dropbox/misc/anki.md'


# show slashes for directories.
alias ls='ls -F'

# alias h='history -i 0' 
alias history='history 0' 

alias chrome='open -a "Google Chrome"'


# Chrome 3000 Port Open...
alias c3po='open -a "Google Chrome" "http://localhost:3000"'

alias tw="$HOME/.rbenv/versions/2.2.0/bin/t"

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# =================
# if work computer
# =================
source ~/dotfiles/zsh/work_computer.sh
# =================
# Functions
# =================

#######################################
# Start an HTTP server from a directory
# Arguments:
#  Port (optional)
#######################################

server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)

  # Simple Pythong Server:
  # python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

  # Simple Ruby Webrick Server:
  ruby -e "require 'webrick';server = WEBrick::HTTPServer.new(:Port=>${port},:DocumentRoot=>Dir::pwd );trap('INT'){ server.shutdown };server.start"
}


function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }

function firefox() { open -a /Applications/Firefox.app/ "http://www.google.com/search?q= $1"; }

function collin() {
    ls /usr/local/bin/collin/

}

function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# ====================================
# Environmental Variables and API Keys
# ====================================

# Below here is an area for other commands added by outside programs or
# commands. Attempt to reserve this area for their use!
##########################################################################
export ZELDA="/Users/collin/dev/Princess_Zelda/"

