#tmux setup

Note:  I have CAPSLOCK remapped as `ctrl-alt-command-shift` using the OS X utility Karabiner.  

In order to use my CAPSLOCK key in tmux (which doesn't appear to have support for 4 different modifier keys used simultaneously), you must instruct iTerm2 to send hex codes (Preferences, Keys, Global Shortcut Keys).

| key combo used in iTerm2 | hex code sent | ASCII  | tmux.conf binding         |
| ------------------------ | ------------- | ------ | --------------------------|
| CAPSLOCK+f               | 0x02          | CTRL+b | prefix key                |
| CAPSLOCK+h               | 0x06          | CTRL+f | cycle-panes-forward       |
| CAPSLOCK+l               | 0x05          | CTRL+e | cycle-panes-backward      |
| CAPSLOCK+u               | 0x07          | CTRL+g | command-prompt            |
| CAPSLOCK+;               | 0x0A          | CTRL+j | choose-window             |
| COMMAND+k                | 0x0B          | CTRL+k | clear screen/scrollback   |

[Hex code table](http://www.unix-manuals.com/refs/misc/ascii-table.html)

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


