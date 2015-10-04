#tmux setup

Note:  I have CAPSLOCK remapped as `ctrl-alt-command-shift` using the OS X utility Karabiner.  

In order to use my CAPSLOCK key in tmux (which doesn't appear to have support for 4 different modifier keys used simultaneously), you must instruct iTerm2 to send hex codes (Preferences, Keys, Global Shortcut Keys).

| key combo used in iTerm2 | hex code sent | ASCII  | tmux.conf binding    |
| ------------------------ | ------------- | ------ | -------------------- |
| CAPSLOCK+f               | 0x02          | CTRL+b | prefix key           |
| CAPSLOCK+h               | 0x06          | CTRL+f | cycle-panes-forward  |
| CAPSLOCK+l               | 0x05          | CTRL+e | cycle-panes-backward |

