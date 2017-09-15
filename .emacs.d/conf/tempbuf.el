(require 'tempbuf)

(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'w3-mode-hook 'turn-on-tempbuf-mode)
;; (add-hook 'Man-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'anything-after-initialize-hook 'turn-on-tempbuf-mode)

(defun my-turn-on-tempbuf-on-vendor-file ()
  (if (string-match "/vendor/" (buffer-file-name))
      (turn-on-tempbuf-mode)))
;; (add-hook 'find-file-hooks 'my-turn-on-tempbuf-on-vendor-file)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)

(defun my-tempbuf-skip-if-light ()
  (if (< (length (buffer-list)) 80)
      (throw 'tempbuf-skip-kill t)))
(defun my-tempbuf-skip-if-dired ()
  (and (eq major-mode 'dired-mode)
       (save-excursion
         (save-restriction
           (widen)
           (goto-char (point-min))
           (re-search-forward "\\.git/$" nil t)))
       (throw 'tempbuf-skip-kill t)))

(add-hook 'tempbuf-kill-hook 'my-tempbuf-skip-if-light)
(add-hook 'tempbuf-kill-hook 'my-tempbuf-skip-if-dired)

;; (defun my-tempbuf-kill-check ()
;;   (message "tempbuf-kill-hook called for %s. tempbuf-timeout=%f idle time=%f" (buffer-name) tempbuf-timeout (tempbuf-time-diff (current-time) tempbuf-last-time))
;; )
;; (add-hook 'tempbuf-kill-hook 'my-tempbuf-kill-check)

(defun tempbuf-check-buffers ()
  "Check all the buffers with tempbuf mode turned on.

Inactive buffers will expire and eventually get killed, active ones
will get additional life expectancy."
  (let ((ct (current-time)))
    (mapcar
     (lambda (buffer)
       (with-current-buffer buffer
	 (when tempbuf-mode
	   (if (get-buffer-window buffer t)
	       (progn
		 (tempbuf-post-command)
		 (tempbuf-grace ct))
	     (when (and (> (tempbuf-time-diff ct tempbuf-last-time)
			   tempbuf-timeout))
	       (tempbuf-expire ct))))))
     (reverse (buffer-list)))))
