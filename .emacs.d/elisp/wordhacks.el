;;
;; GNU Emacs Additional Change.
;;
;;		Kaoru Maeda.

(defun casify-hack (p op)
  (if (and (eolp) (not (bolp))) (setq p (- p)))
  (let ((beg (point))
	(end (save-excursion (forward-word p) (point))))
    (funcall op beg end)
    (goto-char (max beg end))))

(defun downcase-word-hack (p)
  "Downcase last word if at eol and no ARG."
  (interactive "p")
  (casify-hack p 'downcase-region))

(defun upcase-word-hack (p)
  "Upcase last word if at eol and no ARG."
  (interactive "p")
  (casify-hack p 'upcase-region))

(defun capitalize-word-hack (p)
  "Capitalize last word if at eol and no ARG."
  (interactive "p")
  (casify-hack p 'capitalize-region))

(defun backward-word-stop-at-uppercase (p)
  (interactive "P")
  (forward-word-stop-at-uppercase p -1))

(defun forward-word-stop-at-uppercase (arg &optional neg)
  (interactive "P")
  (or neg (setq neg 1))
  (cond ((or (null arg) (eq arg '-))
	 (save-match-data
	   (let* ((p (* neg (prefix-numeric-value arg)))
		  (start (point))
		  (normal (save-excursion (forward-word p) (point)))
		  (case-fold-search nil))
	     (and (re-search-forward "[a-z0-9]\\([A-Z]+\\)" normal 'move p)
		  (match-beginning 1)
		  (goto-char (match-beginning 1))))))
	(t
	 (forward-word (* neg (prefix-numeric-value arg))))))

(defun kill-word-stop-at-uppercase (arg &optional neg)
  (interactive "P")
  (kill-region (point) (progn (forward-word-stop-at-uppercase arg neg) (point))))

(defun backward-kill-word-stop-at-uppercase (arg)
  (interactive "P")
  (kill-word-stop-at-uppercase arg -1))
