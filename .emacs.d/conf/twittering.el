(require 'twittering-mode)
(setq twittering-status-format "%s,  %@:
%FILL[  ]{%T // %r%R}
")

(defvar tsuda-hashtag "#http2study")

(defun tsuda (beg end)
  (interactive "r")
  (let ((string (buffer-substring beg end))
        (sep " "))
    (setq string (replace-regexp-in-string "^\\s-*\\(-+\\)\\s-+" "\\1" string))
    (if (string-match "^-" string)
        (setq sep "\n")
      (setq string (replace-regexp-in-string "\n" " " string)))
    (twittering-update-status (concat string sep tsuda-hashtag))))

(define-key text-mode-map "\C-c\C-c" 'tsuda)
