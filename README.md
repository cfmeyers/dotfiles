#tmux setup

Note:  I have CAPSLOCK remapped as `ctrl-alt-command-shift` using the OS X utility Karabiner.  

In order to use my CAPSLOCK key in tmux (which doesn't appear to have support for 4 different modifier keys used simultaneously), you must instruct iTerm2 to send hex codes (Preferences, Keys, Global Shortcut Keys).

| key combo used in iTerm2 | hex code sent | ASCII  | tmux.conf binding          |
| ------------------------ | ------------- | ------ | -------------------------- |
| CAPSLOCK+f               | 0x02          | CTRL+b | prefix key                 |
| CAPSLOCK+h               | 0x06          | CTRL+f | cycle-panes-backward       |
| CAPSLOCK+l               | 0x18          | CTRL+x | cycle-panes-forward        |
| COMMAND+k                | 0x07          | CTRL+g | clear screen/scrollback    |

[Hex code table](http://www.nthelp.com/ascii.htm)

[Command+k working in tmux trick](https://coderwall.com/p/rkstvg/clear-pane-in-tmux)

#Karabiner/Seil setup

1.)  Go to the Keyboards utility in OS X,

    -  select the "Modifier Keys..." button on the bottom right side.

    -  change the Capslock key to "No Action"

2.)  download and launch Seil

    -  select the "Change the capslock key" checkbox (near the top)

    -  change the keycode option to 80 (this is the keycode for F19)

3.)  download karabiner

    -  symlink the private.xml file from the dotfiles to the location karabiner expects

        -  `ln -s ~/dotfiles/karabiner/private.xml "$HOME/Library/Application\ Support/Karabiner/private.xml"`

    -  open up karabiner, select the "Reload XML" button on the top right

    -  select the Remap Capslock to Hyper with Escape on tap option (which you should now see since you reloaded the XML)

    -  now you can use Capslock as a Hyper key

4.)  while you're in karabiner, 

    -  set the key repeat rate (I'm currently at delay of 40 ms, repeat at 20 ms)

    -  change fn key behavior to ctrl (Change Fn key, select Fn to Control_L

*Note*: in order to get this setup to work with an external keyboard, need to set Capslock key to "No Action" for the external keyboard too (dropdown menue in Modifier Keys section).
#Using Ctags

In your project directory, run

`ctags -R -f ./.git/tags .`

This puts the tag file in the git directory so it won't be versioned

#Setting Up SSH Keys

Check out [this](https://developer.github.com/guides/using-ssh-agent-forwarding/) guide to setting up ssh agent forwarding

#Haksell setup
install haskell by downloading from website

`cabal install ghc-mod`

install `vim2hs` vim plugin for haskell (better syntax highlighting among other things) in `.vim/bundle` with `git clone git@github.com:dag/vim2hs.git`
