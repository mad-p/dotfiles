;; quick help functions
;; Copyright (C) 1987 Hiroaki Takada (Tokyo Univ.)

;; last edited  1-Jun-1987
  
(defun quick-describe-function ()
  "Display the full documentation of the function called at the current point."
  (interactive)
  (describe-function (function-called-at-point)))

(define-key emacs-lisp-mode-map "\C-cf" 'quick-describe-function)
(define-key lisp-interaction-mode-map "\C-cf" 'quick-describe-function)

(defun quick-describe-variable ()
  "Display the full documentation of the variable at the current point."
  (interactive)
  (describe-variable (variable-at-point)))

(define-key emacs-lisp-mode-map "\C-cv" 'quick-describe-variable)
(define-key lisp-interaction-mode-map "\C-cv" 'quick-describe-variable)

