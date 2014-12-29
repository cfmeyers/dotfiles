;;; Compiled snippets and support files for `rhtml-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'rhtml-mode
		     '(("eq" "<%= ${1:printed stuff here} %>" "bracket-equals" nil nil nil nil nil nil)
		       ("per" "<% ${1:logic here} %>" "bracket-percentage" nil nil nil nil nil nil)
		       ("end" "<% end %>" "end" nil nil nil nil nil nil)
		       ("formfor" "<%= form_for ${1:resource} do |f| %>\n${2:}\n<% end %>" "form-for" nil nil nil nil nil nil)
		       ("if" "<% if ${1:predicate} %>\n   ${2:then...}\n<% end %>" "if" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec 17 06:28:07 2014
