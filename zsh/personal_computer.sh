# Personal Computer
source /usr/local/bin/virtualenvwrapper.sh
# ====================================
# PyEnv
# ====================================
eval "$(pyenv init -)"

export ZELDA="/Users/collin/dev/Princess_Zelda/"
alias anki='vim /Users/collin/Dropbox/misc/anki.md'
alias nb='newsbeuter'
alias tw="$HOME/.rbenv/versions/2.2.0/bin/t"

alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -td $HOME/Dropbox/todo/todo.cfg' #Todo.txt alias
alias tls='clear; /usr/local/Cellar/todo-txt/2.10/bin/todo.sh -td $HOME/Dropbox/todo/todo.cfg ls' #
alias tools="ssh -A -i ~/.ssh/testlaptop_id_rsa collin@tools.wineapi.com"

alias killmanage="ps aux | grep manage.py | awk '{print \$2}' | xargs kill"
source ~/.secret_config
