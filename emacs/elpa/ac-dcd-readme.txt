Auto Completion source for DCD.  This code was modified from ac-dscanner.el
which originally came from auto-complete-clang-async.el.  Originally from
the DCD git repository (https://github.com/Hackerpilot/DCD).

Usage:

(require 'ac-dcd)
(add-to-list 'ac-modes 'd-mode)
(add-hook 'd-mode-hook (lambda () (setq ac-sources (append '(ac-source-dcd) ac-sources))))
