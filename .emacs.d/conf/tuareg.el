(if (file-exists-p "~/.opam")
    (progn
      (add-to-load-path "~/.opam/system/share/emacs/site-lisp/")
      (load "tuareg-site-file")
      (add-hook 'tuareg-mode-hook
                #'(lambda ()
                    (check-bindings)
                    (define-key tuareg-mode-map (kbd "M-q") 'scroll-down)
                    ))
      ))
