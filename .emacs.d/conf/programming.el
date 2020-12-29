;;
;; flycheck
;;
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;
;; Ruby
;;
(require 'align)
(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-keyword-list-literal
               (regexp . "[a-zA-Z]:\\(\\s-*\\) \\S-")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list          ;TODO add to rcodetools.el
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode))))
(setq flycheck-ruby-executable "/Users/kaoru.maeda/.rbenv/shims/ruby")
(setq flycheck-python-pycompile-executable "python3")

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;;
;; Java
;;
(require 'java-mode-indent-annotations)
(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)
(add-hook 'java-mode-hook
          #'(lambda ()
              (define-key java-mode-map "\eq" 'scroll-down)))

;;
;; editor config
;;
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;;
;; Groovy
;;
(add-to-list 'auto-mode-alist '("\\bJenkinsfile\\b" . groovy-mode))
(add-hook 'groovy-mode-hook
          #'(lambda ()
              (define-key groovy-mode-map "\eq" 'scroll-down)))

;;
;; Typescript
;;
(require 'typescript-mode)
(require 'prettier-js)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
;; (add-hook 'typescript-mode-hook 'lsp-ui-mode)
(add-hook 'typescript-mode-hook
          #'(lambda ()
              (setq flycheck-checker 'typescript-tslint)
              (flycheck-mode nil)
              (flycheck-mode 1)
              ))
(defvar flycheck-typescript-tslint-project "tsconfig.json")
(flycheck-define-checker typescript-tslint
  "Redefine the tslint checker to handle --type-check."
  :command ("tslint" "--format" "json"
            (config-file "--config" flycheck-typescript-tslint-config)
            (option "--rules-dir" flycheck-typescript-tslint-rulesdir)
            (config-file "--project" flycheck-typescript-tslint-project)
            (eval flycheck-tslint-args)
            ;; Must use inplace to satisfy paths in project.
            source-inplace)
  :error-parser flycheck-parse-tslint
  :modes (typescript-mode))

;;
;; C/C++
;;
(add-hook 'c-mode-hook
          #'(lambda ()
              (define-key c-mode-map "\eq" 'scroll-down)))
(add-hook 'c++-mode-hook
          #'(lambda ()
              (define-key c++-mode-map "\eq" 'scroll-down)))

;;
;; Go
;;

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda ()
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (set (make-local-variable 'compile-command)
                               "go build -v && go test -v && go vet")
                          (local-set-key (kbd "M-.") 'godef-jump))
                          (go-eldoc-setup)
          )
;; (add-hook 'go-mode-hook 'lsp-ui-mode)
