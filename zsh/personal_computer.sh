
alias nb='newsbeuter'

alias tools="ssh -A -i ~/.ssh/testlaptop_id_rsa collin@tools.wineapi.com"

alias killmanage="ps aux | grep manage.py | awk '{print \$2}' | xargs kill"
#source ~/.secret_config


export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
