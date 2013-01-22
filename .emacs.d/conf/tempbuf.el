;; (require 'tempbuf)

;; (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'w3-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'Man-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'anything-after-initialize-hook 'turn-on-tempbuf-mode)

;; (defun my-turn-on-tempbuf-on-vendor-file ()
;;   (if (string-match "/vendor/" (buffer-file-name))
;;       (turn-on-tempbuf-mode)))
;; (add-hook 'find-file-hooks 'my-turn-on-tempbuf-on-vendor-file)

;; (defun my-tempbuf-skip-if-light ()
;;   (if (< (length (buffer-list)) 40)
;;       (throw 'tempbuf-skip-kill t)))
;; (defun my-tempbuf-skip-if-dired ()
;;   (and (eq major-mode 'dired-mode)
;;        (save-excursion
;;          (save-restriction
;;            (widen)
;;            (goto-char (point-min))
;;            (re-search-forward "\\.git" nil t)))
;;        (throw 'tempbuf-skip-kill t)))

;; (add-hook 'tempbuf-kill-hook 'my-tempbuf-skip-if-light)
;; (add-hook 'tempbuf-kill-hook 'my-tempbuf-skip-if-dired)
