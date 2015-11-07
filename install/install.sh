#install xcode command line tools 
#xcode-select --install

#symlink dotfiles to home directory
ln -s ~/dotfiles/vim/vimrc.vim ~/.vimrc
ln -s ~/dotfiles/zsh/zshrc.sh ~/.zshrc
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/githelpers ~/.githelpers
ln -s ~/dotfiles/nosetests/noserc ~/.noserc

ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/newsbeuter/urls ~/.newsbeuter/urls
ln -s ~/dotfiles/newsbeuter/config ~/.newsbeuter/config

ln -s ~/dotfiles/git/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

ln -s ~/dotfiles/python/pdbrc.py ~/.pdbrc.py

ln -s ~/dotfiles/ctags ~/.ctags

ln -s ~/dotfiles/python/base16-ocean-dark.css ~/.ipython/profile_default/static/custom/custom.css
ln -s ~/dotfiles/python/custom.js ~/.ipython/profile_default/static/custom/custom.js

echo 'Installing Homebrew...'
# piping echo to simulate hitting return in the brew install script
echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we're using the latest Homebrew
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install more recent versions of some OS X tools
brew tap homebrew/dupes

brew install homebrew/dupes/grep
brew install zsh
brew install bash
brew install git
brew install hub
brew install the_silver_searcher
brew install vim
brew install ctags
brew install tmux

#python
brew install python
pip install virtualenv
pip install virtualenvwrapper

#databases
brew install postgresql
brew install mysql
brew install sqlite
brew install redis

brew install node
brew install heroku-toolbelt

brew install reattach-to-user-namespace #for tmux copy/paste
#from WDI install script
packagelist=(
  # Autoconf is an extensible package of M4 macros that produce shell scripts to
  # automatically configure software source code packages.
  autoconf
  
  automake # Automake is a tool for automatically generating Makefile.in
  libyaml # a YAML 1.1 parser and emitter
  openssl # A toolkit implementing SSL v2/v3 and TLS protocols with full-strength cryptography world-wide.
  pkg-config # pkg-config is a helper tool used when compiling applications and libraries.
  libxml2 # XML C parser and toolkit
  libxslt # a language for transforming XML documents into other XML documents.
  libiconv # a conversion library between Unicode and traditional encoding
  readline # Adds history for node repl
)

brew install ${packagelist[@]}

#set zsh as default shell
sudo echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh

#RBENV
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.2.0


#GUI apps to install
# google-chrome
# iterm2
# alfred
# dropbox
# karabiner
# seil
# slack
# firefox
# spectacle
# sublime-text-3
# vlc


ln -s ~/dotfiles/karabiner/private.xml "$HOME/Library/Application\ Support/Karabiner/private.xml"

#cleanup homebrew
brew tap --repair
brew cleanup

#setup postgres
#initdb /usr/local/var/postgres -E utf8
initdb `brew --prefix`/var/postgres/data -E utf8
mkdir -p ~/Library/LaunchAgents # Ensure that Postgres launches whenever we login
cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist # Start Postgres now
sleep 5s # give postgres time to load
createdb collin


#Prezto Zsh framework (see setup instructions at https://github.com/sorin-ionescu/prezto)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm .zpreztorc
ln -s ~/dotfiles/zsh/zpreztorc.sh ~/.zpreztorc

#setup mysql
mysql.server start
mysql -u root
# mysql> CREATE DATABASE dev;
# mysql> CREATE USER 'tr_user'@'localhost'
# mysql> GRANT ALL PRIVILEGES ON *.* TO 'tr_user'@'localhost';
# mysql> SET PASSWORD FOR 'tr_user'@'localhost' = PASSWORD('some_cool_password');

##setting up Sequel Pro (local dev db)
# Select the "Socket" option
# username is tr_user
# password is in the mydev.py file
# Database is dev



