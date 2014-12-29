;;;; this loads the package manager
(setq user-full-name "Collin Meyers")
(require 'package)



;;========================================
;; start the emacsserver that listens to emacsclient
(server-start)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(add-to-list 'load-path "~/.emacs.d/ac/")
(add-to-list 'load-path "~/.emacs.d/cfm-elisp-dir/")
(add-to-list 'load-path "~/.emacs.d/cfm-elisp-dir/smartparens")
(add-to-list 'load-path "~/.emacs.d/cfm-elisp-dir/exec-path-from-shell")

;;;loads packages and initializes them
(package-initialize)

(require 'evil)
(require 'org)

;;;; using GUI OS X launch, so need to match up shell 
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)


(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session


(require 'multi-term)
(setq multi-term-program "/usr/local/bin/zsh")
(setq system-uses-terminfo nil);; Use Emacs terminfo, not system terminfo
(setq multi-term-program-switches "--login");;to get rvm gemsets to work
(setq multi-term-scroll-to-bottom-on-output "all");;rspec res display w/o having to scroll


(defun reload-snippets ()
  (interactive)
  (yas-recompile-all)
  (yas-reload-all)
  )

(defun render-all-latex ()
  "http://stackoverflow.com/questions/12827887/universal-pre-argument-c-u-emacs-in-a-function"
  (interactive)
  (let ((current-prefix-arg '(16))) ;; emulate C-u C-u
    (call-interactively 'org-preview-latex-fragment) ;; invoke interactively
    )
  )

;; (defvar test-string "rspec spec/requests/static_pages_spec.rb")
(defvar test-string "rspec")

(defun send-command-to-multi-term ()
  (interactive)
  (multi-term-next)
  (term-send-raw-string test-string)
  (term-send-return)
  (evil-normal-state)
  )

;; (define-key evil-ex-map "t"
;;   (lambda()
;;     (interactive)
;;     (multi-term-next)
;;     (term-send-raw-string test-string)
;;     (term-send-return)
;;     (evil-normal-state)
;;     )
;;   )




;; (define-key evil-ex-map "t"
;;   (lambda()
;;     (interactive)
;;     (eshell)
;;     (evil-insert-state)
;;     (insert "rake")
;;     (evil-normal-state)
;;     (eshell-send-input)
;;     (insert " ")
;;     (evil-normal-state)
;;     (eshell-send-input)
;;     )
;;   )

(define-key evil-ex-map "wt"
  (lambda()
    (interactive)
    (save-buffer)
    (eshell)
    ;; (lambda() (evil-insert) (insert "rake"))
    (evil-insert-state)
    (insert "rake")
    (evil-normal-state)
    (eshell-send-input)
    (insert " ")
    (evil-normal-state)
    (eshell-send-input)
    )
  )



(define-key evil-ex-map "q" 'kill-buffer)
(define-key evil-ex-map "dw" 'delete-window)

(define-key evil-ex-map "pdf" 'org-latex-export-to-pdf)

(define-key evil-ex-map "agenda" 'org-agenda)
(define-key evil-ex-map "oov" 'org-overview)
(define-key evil-ex-map "collapse" 'org-overview)
(define-key evil-ex-map "fold" 'org-overview)
(define-key evil-ex-map "z" 'org-todo-list)

(define-key evil-ex-map "t"
  (lambda()
    (interactive)
    (multi-term-next)
    (evil-normal-state)
    ))


(require 'ruby-tools)
(define-key evil-ex-map "str" 'ruby-tools-to-single-quote-string)
(define-key evil-ex-map "sym" 'ruby-tools-to-symbol)

(define-key evil-ex-map "date" 'org-time-stamp)
(define-key evil-ex-map "dd" 'org-todo)
(define-key evil-ex-map "snippet" 'reload-snippets)
(define-key evil-ex-map "align" 'align)

(define-key evil-ex-map "package" 'package-list-packages)

(define-key evil-ex-map "lorem" 'Lorem-ipsum-insert-paragraphs)

(define-key evil-ex-map "wc" 'count-words-region)


(define-key evil-ex-map "unix"
  (lambda() (interactive)(find-file "~/Dropbox/org/unix/unix.org")))

(define-key evil-ex-map "physics"
  (lambda() (interactive)(find-file "~/Dropbox/org/phys/physics.org")))

(define-key evil-ex-map "crypto"
  (lambda() (interactive)(find-file "~/Dropbox/org/crypto/crypto.org")))

(define-key evil-ex-map "emacs"
  (lambda() (interactive)(find-file "~/Dropbox/org/emacs/emacs.org")))

(define-key evil-ex-map "init"
  (lambda() (interactive)(find-file "~/.emacs.d/init.el")))

(define-key evil-ex-map "latex" 'render-all-latex)
(define-key evil-ex-map "image" 'org-toggle-inline-images)

(define-key evil-ex-map "eval" 'org-babel-execute-src-block)
(define-key evil-ex-map "edit" 'org-edit-src-code)

(define-key evil-ex-map "last" 'last-command)
(define-key evil-ex-map "reload" 'load-file)
(define-key evil-ex-map "rl" 'load-file)

(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-visual-state-map "H" 'evil-first-non-blank)
(define-key evil-motion-state-map "H" 'evil-first-non-blank)

(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "L" 'evil-end-of-line)
(define-key evil-motion-state-map "L" 'evil-end-of-line)

;;Projetile
(define-key evil-normal-state-map (kbd "s-p") 'projectile-find-file)
(define-key evil-visual-state-map (kbd "s-p") 'projectile-find-file)


;;This let's you move up and down big wrapped lines one "screen line" at a time instead
;;of one "logical line" at a time
(define-key evil-normal-state-map "j" 'next-line)
(define-key evil-visual-state-map "j" 'next-line)
(define-key evil-normal-state-map "k" 'previous-line)
(define-key evil-visual-state-map "k" 'previous-line)


(define-key evil-normal-state-map "J" 'previous-user-buffer)
(define-key evil-normal-state-map "K" 'next-user-buffer)

(define-key evil-normal-state-map "\C-j" 'evil-join)

;;Rails Movements
(define-key evil-normal-state-map "grm" 'projectile-rails-find-current-model)
(define-key evil-normal-state-map "grc" 'projectile-rails-find-current-controller)
(define-key evil-normal-state-map "grv" 'projectile-rails-find-current-view)
(define-key evil-normal-state-map "grs" 'projectile-rails-find-current-spec)

(define-key evil-normal-state-map "g." (lambda()
					 (interactive)
					 (find-file "~/.emacs.d/init.el")))


(load "auctex.el" nil t t)
(add-to-list 'exec-path "/usr/local/texlive/2013/bin/universal-darwin")

(setq exec-path (append exec-path '("/usr/texbin")))


(require 'key-chord)(key-chord-mode 1) ; turn on key-chord-mode

;; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(define-key evil-insert-state-map "j" #'cofi/maybe-exit)
 
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))



(key-chord-define evil-insert-state-map "uu" (kbd "_"))
(key-chord-define evil-insert-state-map "aa" (kbd "@"))

(global-evil-leader-mode)
(evil-mode t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


(require 'ido)
(ido-mode t)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;;set ido vertically for goto command
(define-key evil-normal-state-map "gc" 
  (lambda ()
    (interactive)
    (call-interactively
     (intern
      (ido-completing-read
       "M-x "
       (all-completions "" obarray 'commandp))))))

;;set ido autocomplete globabally for meta x command
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

;; projectile
(require 'projectile)
(projectile-global-mode)



;; (load-theme 'zenburn t)
(load-theme 'grandshell t)

(setq org-latex-create-formula-image-program 'dvipng)

(org-babel-do-load-languages
 'org-babel-load-languages

 '(
   (emacs-lisp . t)
   (lisp . t)
   (sh . t)
   (python . t)
   (latex . t)
   ))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.2))



(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;;fix problem with yasnippets inserting line after every snippet
(setq-default mode-require-final-newline nil)


;;; esc quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)



(define-key evil-normal-state-map "TAB" 'org-cycle)

(add-hook 'org-mode-hook
	  (lambda ()
	    (toggle-word-wrap)
	    (toggle-truncate-lines)))


(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t) 

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-hl-line-mode +1);;highlight current line


;; (require 'paren);;parenthesis highlighting
;; (setq show-paren-style 'parenthesis)
;; (show-paren-mode +1)

;; (electric-pair-mode +1);;automatic pair parenthesis
;; from http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/#
(require 'rhtml-mode)
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

(set-default-font "Inconsolata")
;; (set-face-attribute 'default nil :height 250) ;;set font size at startup
(set-face-attribute 'default nil :height 200) ;;set font size at startup

(require 'evil-nerd-commenter)
(define-key evil-normal-state-map "C" 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map "C" 'evilnc-comment-or-uncomment-lines)

;;backup
;; (setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-default nil);;no backup files (previous line stopped working for some reason)
(setq make-backup-files nil)

;; Kill all dired buffers
(defun kill-all-dired-buffers ()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
	(set-buffer buffer)
	(when (equal major-mode 'dired-mode)
	  (setq count (1+ count))
	  (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))

(require 'dired)


(eval-after-load 'dired
  '(progn
     ;; use the standard Dired bindings as a base
     (evil-make-overriding-map dired-mode-map 'normal t)
     (evil-define-key 'normal dired-mode-map
       "h" 'evil-backward-char
       "j" 'evil-next-line
       "k" 'evil-previous-line
       "l" 'evil-forward-char
       "q" 'kill-all-dired-buffers
       "J" 'previous-buffer      ; "j"
       "K" 'next-buffer   ; "k"
       "r" 'dired-do-redisplay))) ; "l"

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  ":" 'execute-extended-command
  "<SPC>" 'switch-to-prev-buffer
  "L" 'org-preview-latex-fragment
  "I" 'org-toggle-inline-images
  "h" 'org-insert-heading
  "a" 'org-agenda
  "n" 'outline-next-visible-heading
  "p" 'switch-to-prev-buffer
  "f" 'ido-find-file 
  "r" 'revert-buffer
  "t" 'send-command-to-multi-term 
  "q" 'kill-buffer)

;; (define-key evil-normal-state-map "gml" 'org-preview-latex-fragment)
;; (define-key evil-normal-state-map "gmi" 'org-toggle-inline-images)

(require 'evil-matchit)
(defun evilmi-customize-keybinding ()
  (evil-define-key 'normal evil-matchit-mode-map
    "gm" 'evilmi-jump-items
    ",si" 'evilmi-select-items
    ",di" 'evilmi-delete-items
    )
  )
(global-evil-matchit-mode 1)


(global-evil-matchit-mode 1)

;; (define-key org-agenda-mode-map "j" 'evil-next-line)
;; (define-key org-agenda-mode-map "k" 'evil-previous-line)


(add-hook 'org-agenda-mode-hook
	  (lambda ()
	    (define-key org-agenda-mode-map "J" 'evil-next-buffer)
	    (define-key org-agenda-mode-map "K" 'evil-prev-buffer)
	    (define-key org-agenda-mode-map "b" 'evil-backward-word-begin)
	    (define-key org-agenda-mode-map "h" 'evil-backward-char)
	    (define-key org-agenda-mode-map "j" 'evil-next-line)
	    (define-key org-agenda-mode-map "k" 'evil-previous-line)
	    (define-key org-agenda-mode-map "l" 'evil-forward-char)
	    (define-key org-agenda-mode-map "n" 'evil-forward-word-begin)
	    (define-key org-agenda-mode-map "p" 'evil-forward-word-begin)
	    (define-key org-agenda-mode-map "w" 'evil-forward-word-begin)))

(key-chord-define evil-normal-state-map ",d" 'org-todo)
(key-chord-define evil-normal-state-map ",t" 'org-insert-todo-heading)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/org/todo/todo.org")))
 '(org-confirm-babel-evaluate nil))


;; Disabling messages buffer and completions is from this stack overflow article:
;;http://stackoverflow.com/questions/10164929/emacs-disable-messages-buffer

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook 
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))



;; To open pages for editing in new frames using a running emacs
;; started in --daemon mode:
(require 'edit-server)
(when (and (require 'edit-server nil t) (daemonp))
  (edit-server-start))
(edit-server-start)

;;Auto Complete Mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac/ac-dict")
(ac-config-default)

;; keeps dumb buffer from showing up that's difficult to kill
(setq woman-show-log nil) 

(setq org-log-done t)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-preview-default nil) ;; disables annoying preview window

(add-hook 'emmet-mode-hook
          (lambda ()
            ;; define new M-j key mapping instead.
            (define-key emmet-mode-keymap (kbd "TAB")        'emmet-expand-line)))

(add-hook 'package-menu-mode-hook
          (lambda ()
	    (define-key package-menu-mode-map "j" 'evil-next-line)
	    (define-key package-menu-mode-map "k" 'evil-previous-line)
	    (define-key package-menu-mode-map "J" 'previous-buffer)
	    (define-key package-menu-mode-map "K" 'next-buffer)
	    (define-key package-menu-mode-map "/" 'isearch-forward)
	    
	    (key-chord-define package-menu-mode-map ":q" 'kill-buffer)
	    ))

(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" "" t)


(require 'evil-surround)
(global-evil-surround-mode 1)

;;from http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
(require 'highlight-indentation)
(add-hook 'ruby-mode-hook
	  (lambda () (highlight-indentation-current-column-mode)))

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)


(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(require 'scss-mode)
(setq scss-compile-at-save nil)

;;from http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
    (require 'smooth-scrolling)
    (setq smooth-scroll-margin 5)
    (setq scroll-conservatively 9999
	  scroll-preserve-screen-position t)

    (require 'powerline)
    (powerline-evil-vim-color-theme)
    (display-time-mode t)
