(require 'lsp-mode)
;(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-sideline-update-mode 'line)  ;; line or point
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-symbol t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-ignore-duplicate t)

(setq lsp-eldoc-enable-hover nil)
