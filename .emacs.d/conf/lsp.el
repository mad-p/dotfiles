;(add-to-load-path "~/share/emacs/site-lisp/lsp-ui")
;(add-to-load-path "~/share/emacs/site-lisp/lsp-javascript")
(require 'lsp-mode)
(require 'lsp-ui)
;(require 'lsp-typescript)
;(require 'lsp-javascript-typescript)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-sideline-enable t)
;(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
;(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable)
;;(add-hook 'js-mode-hook #'lsp-typescript-enable)
;;(add-hook 'typescript-mode-hook #'lsp-typescript-enable)


;; (lsp-define-stdio-client
;;  ;; This can be a symbol of your choosing. It will be used as a the
;;  ;; prefix for a dynamically generated function "-enable"; in this
;;  ;; case: lsp-prog-major-mode-enable
;;  lsp-prog-major-mode
;;  "language-id"
;;  ;; This will be used to report a project's root directory to the LSP
;;  ;; server.
;;  (lambda () default-directory)
;;  ;; This is the command to start the LSP server. It may either be a
;;  ;; string containing the path of the command, or a list wherein the
;;  ;; car is a string containing the path of the command, and the cdr
;;  ;; are arguments to that command.
;;  '("/my/lsp/server" "and" "args"))

;; Here we'll add the function that was dynamically generated by the
;; call to lsp-define-stdio-client to the major-mode hook of the
;; language we want to run it under.
;;
;; This function will turn lsp-mode on and call the command given to
;; start the LSP server.
(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
