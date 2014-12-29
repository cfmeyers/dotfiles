;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("ae" "[latex]\\begin{align*} ${1:left} &= ${2:right} \\\\\\\\ &= ${3:next right} \\end{align*}[/latex] $0" "anki-equation-latex-syntax" nil nil nil nil nil nil)
		       ("al" "[\\$]${1:latex}[/\\$]$0" "anki-latex-syntax" nil nil nil nil nil nil)
		       ("cloze" "{{c1::${1:cloze}}}$0" "anki-cloze-syntax" nil nil nil nil nil nil)
		       ("cong" "${1:a} \\equiv ${2:b} \\mod ${3:n}$0" "congruence latex syntax " nil
			("math")
			nil nil nil nil)
		       ("emf" "\\mathcal{E}$0" "emf latex orgmode" nil
			("math")
			nil nil nil nil)
		       ("equation" "\\begin{align}\n${1:leftside} &= ${2:rightside} \\\\\\\n&= ${3:more right side}\n\\end{align}\n$0" "equations-latex" nil nil nil nil nil nil)
		       ("phi" "\\phi(${1:argument})$0" "euler phi function" nil
			("math")
			nil nil nil nil)
		       ("frac" "\\frac{${1:numerator}}{${2:denominator}}$0\n" "\\frac{numerator}{denominator}" nil
			("math")
			nil nil nil nil)
		       ("icong" "\\\\( ${1:a} \\equiv ${2:b} \\mod ${3:n} \\\\)$0" "orgmode-inline-latex-congruence " nil nil nil nil nil nil)
		       ("ivec" "\\\\(\\vec{${1:vector}}\\\\)$0" "orgmode-inline-latex-vector " nil nil nil nil nil nil)
		       ("il" "\\\\(${1:latex}\\\\)$0" "inline-latex" nil nil nil nil nil nil)
		       ("pfrac" "\\left(\\frac {${1:numerator}}{${2:denominator}}\\right)$0" "orgmode-latex-parenthesis-fraction" nil nil nil nil nil nil)
		       ("vec" " \\vec\\{${1:ze vector}\\} $0 \n" "orgmode-latex-vector " nil nil nil nil nil nil)
		       ("lv" "\\vec{${1:numerator}}$0\n" "ve" nil
			("math")
			nil nil nil nil)
		       ("math" "\\[${1:latex}\\]$0\n" "math-latex" nil nil nil nil nil nil)
		       ("bo" "*${1:bolded text}*$0" "orgmode-bold" nil nil nil nil nil nil)
		       ("br" "<br>$0" "orgmode-html-break" nil nil nil nil nil nil)
		       ("em" "<em>${1:word}</em>$0" "orgmode-html-emphasis" nil nil nil nil nil nil)
		       ("im" "[[file:~/Dropbox/Public/images/${1:file name}.png]]$0" "orgmode-image" nil nil nil nil nil nil)
		       ("it" "/${1:bolded text}/$0" "orgmode-italics" nil nil nil nil nil nil)
		       ("link" "[[${1:link}][${2:}]]$0\n" "orgmode-link-with-descriptive-text" nil nil nil nil nil nil)
		       ("elisp" "#+BEGIN_SRC elisp :exports both\n${1:shell script here}\n#+END_SRC\n$0\n" "orgmode-sourcecode-elisp" nil nil nil nil nil nil)
		       ("shell" "#+BEGIN_SRC sh :exports both\n${1:shell script here}\n#+END_SRC\n$0\n" "orgmode-sourcecode-shell" nil nil nil nil nil nil)
		       ("sn" "${1:number} \\times 10^{${2:exponent}}$0" "scientific notation" nil
			("math")
			nil nil nil nil)
		       ("set" "\\left\\\\{ {${1:elements}}\\right\\\\}$0" "set notation latex" nil
			("math")
			nil nil nil nil)
		       ("python" "#+BEGIN_SRC python :exports both\n${1:shell script here}\n#+END_SRC\n$0" "orgmode-sourcecode-python" nil nil nil nil nil nil)
		       ("shell" "#+BEGIN_SRC sh :exports both\n${1:shell script here}\n#+END_SRC\n$0\n\n\n\n\n\n\n\n\n\n" "orgmode-sourcecode-shell" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec 17 06:28:07 2014
