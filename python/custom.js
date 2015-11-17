// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file.
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 *
 * The object available at load time depend on the version of IPython in use.
 * there is no guaranties of API stability.
 *
 * The example below explain the principle, and might not be valid.
 *
 * Instances are created after the loading of this file and might need to be accessed using events:
 *     define([
 *        'base/js/namespace',
 *        'base/js/events'
 *     ], function(IPython, events) {
 *         events.on("app_initialized.NotebookApp", function () {
 *             IPython.keyboard_manager....
 *         });
 *     });
 *
 * __Example 1:__
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    define([
 *        'base/js/namespace',
 *        'base/js/events'
 *    ], function(IPython, events) {
 *        events.on('app_initialized.NotebookApp', function(){
 *            IPython.toolbar.add_buttons_group([
 *                {
 *                    'label'   : 'run qtconsole',
 *                    'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                    'callback': function () {
 *                        IPython.notebook.kernel.execute('%qtconsole')
 *                    }
 *                }
 *                // add more button here if needed.
 *                ]);
 *        });
 *    });
 *
 * __Example 2:__
 *
 * At the completion of the dashboard loading, load an unofficial javascript extension
 * that is installed in profile/static/custom/
 *
 *    define([
 *        'base/js/events'
 *    ], function(events) {
 *        events.on('app_initialized.DashboardApp', function(){
 *            require(['custom/unofficial_extension.js'])
 *        });
 *    });
 *
 * __Example 3:__
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */

//Taken from http://stackoverflow.com/questions/25730516/vi-shortcuts-in-ipython-notebook/31228552#31228552
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
