; (setq ack-switches " --flush --nopager --nocolor --nogroup ")
(setq ack-command
      (cond ((file-executable-p "/usr/local/bin/rg") "/usr/local/bin/rg")
            ((file-executable-p "/opt/homebrew/bin/rg") "/opt/homebrew/bin/rg")))

(setq ack-switches " --no-heading ")
(load (expand-file-name "~/share/emacs/site-lisp/ack"))
(fset 'rg 'ack)
; (load (expand-file-name "~/share/emacs/site-lisp/ag"))

(require 'grep-a-lot)
(grep-a-lot-setup-keys)

(require 'grep-edit)

(require 'color-moccur)

(require 'summarye)

(defun purge-grep-buffer ()
  (interactive)
  (mapcar #'(lambda (b)
              (if (string-match "\\*grep\\*" (buffer-name b))
                  (kill-buffer b)))
          (buffer-list)))
