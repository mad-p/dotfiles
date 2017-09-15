(setq ack-switches " --flush --nopager --nocolor --nogroup --ignore-dir=test --ignore-dir=tmp --ignore-dir=jsdoc --ignore-dir=vendor --ignore-dir=doc --ignore-dir=coverage --ignore-dir=spec/reports --ignore-dir=reports --ignore-file=ext:annot ")
(load (expand-file-name "~/share/emacs/site-lisp/ack"))
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
