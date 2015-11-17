export WORKON_HOME=$HOME/.virtualenvs
alias api="cd /Users/colinmeyers/dev/lot/API"

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
        source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

