(setq helm-command-prefix-key "C-.")
(require 'helm)
(require 'helm-config)
(require 'helm-for-files)

(define-key helm-map "\C-k" (lambda () (interactive) (delete-minibuffer-contents)))
(setq helm-map-C-j-binding 'helm-select-3rd-action)
(define-key helm-map "\C-j" helm-map-C-j-binding)
;(define-key helm-map "\C-e" 'helm-select-2nd-action-or-end-of-line)
(define-key helm-map "\C-s" 'helm-isearch)
(define-key helm-map "\C-q" 'helm-next-page)
(define-key helm-map "\M-q" 'helm-previous-page)
;(define-key helm-map "\C-z" 'helm-execute-persistent-action)
;(define-key helm-map "\C-b" 'helm-backward-char-or-insert-buffer-name)
(define-key helm-map "\C-o" 'helm-next-source)
(define-key helm-map "\C-v" 'helm-next-source)
(define-key helm-map "\C-\M-q" 'helm-scroll-other-window-down)
(define-key helm-map [tab] (function (lambda () (interactive)(helm-update))))

(define-key helm-command-map "x" 'helm-execute-extended-command)
(define-key helm-command-map "o" 'helm-occur)
(define-key helm-command-map "f" 'helm-find-files)
(define-key helm-command-map "b" 'helm-multi-files)
(define-key helm-command-map "y" 'helm-show-kill-ring)
(define-key helm-command-map "j" 'helm-c-pp-bookmarks)
(define-key helm-command-map (kbd "C-.") 'helm-c-etags-select)

(defun helm-update-or-select-action ()
  "Immediately update helm candidates without delay.
If invoked twice in a row, does helm-select-action"
  (interactive)
  (if (eq last-command 'helm-update-or-select-action)
      (helm-select-action)
    (helm-check-new-input (minibuffer-contents))))

(mapc #'(lambda (sym)
          (let ((map (and (boundp sym) (symbol-value sym))))
            (and map
                 (mapc #'(lambda (key)
                           (if (eq (lookup-key map key) 'helm-select-action)
                               (define-key map key 'helm-update-or-select-action)))
                       (list "\C-i" (kbd "<tab>"))))))
      '(helm-map helm-c-bookmark-map helm-c-buffer-map
                     helm-c-etags-map helm-c-grep-map helm-c-pdfgrep-map
                     helm-c-read-file-map helm-c-ucs-map
                     helm-esh-on-file-map helm-eval-expression-map
                     helm-find-files-map helm-generic-files-map))

(setq helm-input-idle-delay 0.2)
