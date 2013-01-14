
;;
;; Emacs Lisp
;;
(defun eval-defvar-as-defconst (arg)
  "Evaluate defun that point is in or before.  Substituting defvar with defconst.
Print value in minibuffer.
With argument, insert value in current buffer after the defun."
  (interactive "P")
  (let (beg end temp (buf (current-buffer)))
    (save-excursion
      (end-of-defun)
      (setq end (point))
      (beginning-of-defun)
      (setq beg (point))
      (if (looking-at "^(defvar")
	  (progn
	    (save-excursion
	      (setq beg (match-end 0))
	      (set-buffer (generate-new-buffer " *eval-temp*"))
	      (erase-buffer)
	      (setq temp (current-buffer))
	      (insert "(defconst")
	      (insert-buffer-substring buf beg end)
	      (goto-char (point-min)))
	    (unwind-protect
		(message (prin1-to-string (eval (read temp))))
	      (kill-buffer temp)))
	(eval-region beg end (if arg buf t))))))


;;
;; Dired
;;
(eval-when-compile
  (require 'dired))

(defun dired-bury-buffer ()
  "In dired, stop editing this buffer."
  (interactive)
  (let ((obuf (current-buffer)))
    (switch-to-buffer (other-buffer))
    (bury-buffer obuf)))

(defun dired-kill-buffer ()
  (interactive)
  (kill-buffer nil))

(defun dired-do-find-file (&optional arg)
  "Find marked (or next ARG) files."
  (interactive "P")
  (dired-map-over-marks-check (function dired-do-find-file-one) arg 'visit t))

(defun dired-do-find-file-one () (dired-display-file)  nil)


;;
;; Extension To Buffer-Menu
;; 

(defun Buffer-menu-revert ()
  "Mark buffer on this line to be reverted by \\[Buffer-menu-execute] command."
  (interactive)
  (beginning-of-line)
  (if (looking-at " [-M]")		;header lines
      (ding)
    (let ((buffer-read-only nil))
      (delete-char 1)
      (insert ?R)
      (forward-line 1))))

(defun Buffer-menu-execute ()
  "Save, revert, and/or delete buffers marked with \\[Buffer-menu-save], \\[Buffer-menu-revert] or \\[Buffer-menu-delete] commands."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (forward-line 1)
    (while (re-search-forward "^.S" nil t)
      (let ((modp nil))
	(save-excursion
	  (set-buffer (Buffer-menu-buffer t))
	  (save-buffer)
	  (setq modp (buffer-modified-p)))
	(let ((buffer-read-only nil))
	  (delete-char -1)
	  (insert (if modp ?* ? ))))))
  (save-excursion
    (goto-char (point-min))
    (forward-line 1)
    (let ((buff-menu-buffer (current-buffer))
	  (buffer-read-only nil))
      (while (search-forward "\nD" nil t)
	(forward-char -1)
	(let ((buf (Buffer-menu-buffer nil)))
	  (or (eq buf nil)
	      (eq buf buff-menu-buffer)
	      (save-excursion (kill-buffer buf))))
	(if (Buffer-menu-buffer nil)
	    (progn (delete-char 1)
		   (insert ? ))
	  (delete-region (point) (progn (forward-line 1) (point)))
 	  (forward-char -1)))))
  (save-excursion
    (goto-char (point-min))
    (forward-line 1)
    (let ((buff-menu-buffer (current-buffer))
	  (buffer-read-only nil))
      (while (search-forward "\nR" nil t)
	(forward-char -1)
	(let ((buf (Buffer-menu-buffer nil)))
	  (or (eq buf nil)
	      (eq buf buff-menu-buffer)
	      (save-excursion
		(set-buffer buf)
		(revert-buffer))))
	(if (Buffer-menu-buffer nil)
	    (progn (delete-char 1)
		   (insert ? ))
 	  (forward-char -1))))))
