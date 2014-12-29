;;; Compiled snippets and support files for `ruby-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ruby-mode
		     '(("i" "#\\{${1:string here}\\}" "string interpolate" nil nil nil nil nil nil)
		       ("d" "describe ${1:thing} do\n${2:body}\n\nend" "rspec describe assertion" nil nil nil nil nil nil)
		       ("it" "it \\{ ${1:string here} \\}" "rspec it assertion" nil nil nil nil nil nil)
		       ("its " "it \"${1:string here}\" do\n${2:body}\nend" "rspec it string assertion" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec 17 06:28:07 2014
