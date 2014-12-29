Step 1:  Begin by cloning the project in your home directory.  Use the command:
                        git clone ~/Dropbox/text/repos/dotfiles/vim ~/.vim
Step 2:  install a fontpatcher using sudo apt-get install python-fontforge
Step 3:  make a directory called ~/.fonts
Step 4:  In this directory run git clone https://github.com/scotu/ubuntu-mono-powerline.git
Step 5:  make a symlink for your .vimrc file in the home directory with command:
                ln -s .vim/vimrc.vim .vimrc   
Step 6:  In the directory ~/.vim/, run the following git command to update your subdirectories:
                git submodule update --init
(this pulls the latest copies of your submodule folders (the bundles) from github).

Step 7:  In the directory ~/.vim/, run the following command (so you can push local changes to repository):
                
                git remote add synched_dotfiles ~/Dropbox/text/repos/dotfiles/vim


Installing plugins as submodules:
Step 1:  in your local ~/.vim/ repository run the following command:
                            git submodule add http://github.com/plugin-you-want bundle/name-of-plugin-you-want 
For example, for fugutive you would type:
                            git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive

Pushing local changes to the dropbox repository:
                            git add .
                            git commit -m "your message"
                            git push synched_dotfiles master

Pulling new changes from the dropbox repository:
                            git pull synched_dotfiles master


References:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
https://freshmob.com.au/using-dropbox-as-a-git-repository/



