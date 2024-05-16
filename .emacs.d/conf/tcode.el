(add-to-load-path "~/share/emacs/site-lisp/tc")
(setq tcode-mazegaki-face (prog1
	                      (make-face 'mazegaki-conversion)
                            (set-face-underline 'mazegaki-conversion t)))
(require 'tc-setup)
