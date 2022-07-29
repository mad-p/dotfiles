(setq anything-command-map-prefix-key "C-.")
(require 'anything-startup)
(anything-read-string-mode-uninstall)

(define-key global-map (kbd "C-;") 'anything)

(define-key anything-map "\C-k" (lambda () (interactive) (delete-minibuffer-contents)))
(setq anything-map-C-j-binding 'anything-select-3rd-action)
(define-key anything-map "\C-j" anything-map-C-j-binding)
(define-key anything-map "\C-e" 'anything-select-2nd-action-or-end-of-line)
(define-key anything-map "\M-N" 'anything-next-source)
(define-key anything-map "\M-P" 'anything-previous-source)
(define-key anything-map "\C-\M-n" 'anything-next-source)
(define-key anything-map "\C-\M-p" 'anything-previous-source)
(define-key anything-map "\C-s" 'anything-isearch)
(define-key anything-map "\C-p" 'anything-previous-line)
(define-key anything-map "\C-n" 'anything-next-line)
(define-key anything-map "\C-q" 'anything-next-page)
(define-key anything-map "\M-q" 'anything-previous-page)
(define-key anything-map "\C-z" 'anything-execute-persistent-action)
(define-key anything-map "\C-b" 'anything-backward-char-or-insert-buffer-name)
(define-key anything-map "\C-o" 'anything-next-source)
(define-key anything-map "\C-v" 'anything-next-source)
(define-key anything-map "\C-\M-q" 'anything-scroll-other-window-down)
(define-key anything-map [tab] (function (lambda () (interactive)(anything-update))))

(anything-read-string-mode-uninstall)
(define-key anything-command-map "x" 'anything-execute-extended-command)
(define-key anything-command-map "o" 'anything-occur)
(define-key anything-command-map "b" 'anything-for-buffers)
(define-key anything-command-map "y" 'anything-show-kill-ring)
(define-key anything-command-map "j" 'anything-c-pp-bookmarks)
(define-key anything-command-map (kbd "C-.") 'anything-c-etags-select)

(defun anything-update-or-select-action ()
  "Immediately update anything candidates without delay.
If invoked twice in a row, does anything-select-action"
  (interactive)
  (if (eq last-command 'anything-update-or-select-action)
      (anything-select-action)
    (anything-check-new-input (minibuffer-contents))))

(mapc #'(lambda (sym)
          (let ((map (and (boundp sym) (symbol-value sym))))
            (and map
                 (mapc #'(lambda (key)
                           (if (eq (lookup-key map key) 'anything-select-action)
                               (define-key map key 'anything-update-or-select-action)))
                       (list "\C-i" (kbd "<tab>"))))))
      '(anything-map anything-c-bookmark-map anything-c-buffer-map
                     anything-c-etags-map anything-c-grep-map anything-c-pdfgrep-map
                     anything-c-read-file-map anything-c-ucs-map
                     anything-esh-on-file-map anything-eval-expression-map
                     anything-find-files-map anything-generic-files-map))

(setq anything-idle-delay 0.2
      anything-input-idle-delay 0.2)
