;;; Compiled snippets and support files for `snippet-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippet-mode
		     '(("field" "\\${${2:n}:${4:your text here }\\}$0" "${ ...  } field" nil nil nil nil nil nil)
		       ("snip" "\n# -*- mode: snippet; require-final-newline: nil -*-\n# contributor: `user-full-name`\n# name:${1:snippet name}\n# key: ${2:snippet keyword}\n# --\n$0\n" "snippet" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec 17 06:28:07 2014
