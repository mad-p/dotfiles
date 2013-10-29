(require 'highlight-indentation)
(add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

(add-hook 'ruby-mode-hook 'highlight-indentation-mode)
(add-hook 'emacs-lisp-mode-hook  'highlight-indentation-mode)
