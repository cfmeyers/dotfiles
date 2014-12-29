# ZSH config Aliases
alias zshconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zconfig="vim ~/dotfiles/zsh/zshrc.sh"
alias zshreload="source ~/.zshrc; echo sourcing zshrc!"
alias zreload="source ~/.zshrc; echo sourcing zshrc!"
alias reload="source ~/.zshrc; echo sourcing zshrc!"


#Misc Aliases
alias celar="clear"
alias c="clear"
alias video="sudo killall VDCAssistant"
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
alias snippets='~/.emacs.d/snippets'
alias ipython='ipython --no-banner'

#TrueCrypt Aliases
alias tc="/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text"
alias tcm="tc --text --mount /Users/collin/Dropbox/MusicBackup/MusicBackup2 /Volumes/TrueCrypt"
alias scribbles="cd /Volumes/TrueCrypt/scribbles/source/_posts"
alias scrib="cd /Volumes/TrueCrypt/scribbles/source/_posts"
alias sand="cd ~/dev/sand/source/_posts"

#Personal Script Aliases
alias np="python ~/dev/scripts/octopress/newpost.py"
alias phys="python ~/dev/scripts/octopress/newPhysicsPost.py"
alias crypto="python ~/dev/scripts/octopress/newCryptographyPost.py"
alias runs="python run.py runserver"
alias get_backbone="bash ~/dev/scripts/bash/download_backbone_pack.sh"


##PATH

PATH="$HOME/.rbenv/bin:$PATH"                              # RBENV
PATH="/usr/local/share/npm/bin:$PATH"                      # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                        # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"      # Coreutils
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

# ====================
# Aliases
# ====================

# show slashes for directories.
alias ls='ls -F'

alias h='history'

alias chrome='open -a "Google Chrome"'

# Chrome 3000 Port Open...
alias c3po='open -a "Google Chrome" "http://localhost:3000"'

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
