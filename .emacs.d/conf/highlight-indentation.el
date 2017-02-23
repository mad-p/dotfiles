(require 'highlight-indentation)
(defun turn-on-highlight-indentation-mode ()
  (highlight-indentation-mode 1)
  (highlight-indentation-current-column-mode 1))

(add-hook 'ruby-mode-hook 'turn-on-highlight-indentation-mode)
(add-hook 'tuareg-mode-hook 'turn-on-highlight-indentation-mode)
(add-hook 'emacs-lisp-mode-hook  'turn-on-highlight-indentation-mode)
