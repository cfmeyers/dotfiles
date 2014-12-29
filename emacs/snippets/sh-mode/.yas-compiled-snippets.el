;;; Compiled snippets and support files for `sh-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sh-mode
		     '(("template" "#!/bin/bash\nset -euo pipefail\nIFS=$'\\n\\t'\n\nif [[ -z \"\\$1\" ]] ; then\n    echo \"This script ${1:your explanation here}\" \nelse\n\n$0\n\nfi\n" "basic-shell-template" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec 17 06:28:07 2014
