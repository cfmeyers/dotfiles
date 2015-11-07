

#Setting Up IPython Notebook

After you've installed ipython, you'll have a `.ipython` directory in your home directory.

Delete your default `custom.css` file with `rm ~/.ipython/profile_default/static/custom/custom.css`.
Likewise delete your default `custom.js` file with `rm ~/.ipython/profile_default/static/custom/custom.js`.

Symlink those two files from your dotfiles back into your `.ipython` directory with:

`ln -s ~/dotfiles/python/base16-ocean-dark.css ~/.ipython/profile_default/static/custom/custom.css`

`ln -s ~/dotfiles/python/custom.js ~/.ipython/profile_default/static/custom/custom.js`

##Getting Vim Bindings in IPython Notebook

For script to place in custom.js, see [this](http://stackoverflow.com/questions/25730516/vi-shortcuts-in-ipython-notebook/31228552#31228552) stack overflow answer.

For custom key bindings (e.g. typing `kj` in insert mode to go into normal mode) with CodeMirror, see [this](https://github.com/codemirror/CodeMirror/issues/2840) issue on github.

Place the line `CodeMirror.Vim.map('kj', '<Esc>', 'insert');` inside the code snippet that enables vim mode in custom.js like so:

```javascript
define([
  'base/js/namespace',
  'base/js/events',
  'jquery',
  'codemirror/keymap/vim',
  'codemirror/addon/dialog/dialog'
], function(IPython, events, $) {
  events.on('app_initialized.NotebookApp', function() {
    IPython.keyboard_manager.edit_shortcuts.remove_shortcut('esc');
    IPython.Cell.options_default.cm_config.vimMode = true;
    // codemirror dialog for cmdline and search
    $('head').append('<link rel="stylesheet" type="text/css" ' +
      'href="/static/components/codemirror/addon/dialog/dialog.css">')
    $('head').append('<style type="text/css">' +
      '.CodeMirror-dialog {opacity: 0.9 !important;}</style>');
    // avoid ipython command mode while in codemirror dialog
    var bind_events = IPython.Cell.prototype.bind_events;
    // rebinding keys: https://github.com/codemirror/CodeMirror/issues/2840
    CodeMirror.Vim.map('kj', '<Esc>', 'insert');
    IPython.Cell.prototype.bind_events = function () {
      bind_events.apply(this);
      if (!this.code_mirror) return;
      var that = this;
      this.code_mirror.on('blur', function() {
        if ($('.CodeMirror-dialog').length > 0)
          that.events.trigger('edit_mode.Cell', {cell: that});
      });
    }
  });
});
```
