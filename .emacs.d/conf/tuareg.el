(if (file-exists-p "~/.opam")
    (progn
      (add-to-load-path "~/.opam/system/share/emacs/site-lisp/")
      (load "tuareg-site-file")))
