(add-to-load-path "~/share/emacs/site-lisp/tc")
(setq tcode-mazegaki-face (prog1
                              (make-face 'mazegaki-conversion)
                            (set-face-underline 'mazegaki-conversion t)))
(require 'tc-setup)

;; for uim-leim.el
(define-obsolete-variable-alias 'inactivate-current-input-method-function
  'deactivate-current-input-method-function "24.3")
(define-obsolete-function-alias 'inactivate-input-method
  'deactivate-input-method "24.3")
