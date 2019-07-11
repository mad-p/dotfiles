;; (require 'perlbrew)
;; (perlbrew-switch "perl-5.22.3")
;; (setq flycheck-perl-executable (expand-file-name "~/bin/perl-flychecker"))

;; (flycheck-define-checker perl-auto-carton
;;   "A perl syntax checker."
;;   :command ("perl-flychecker"
;;             "-wc"
;;             source-inplace)
;;   :error-patterns ((error line-start
;;                           (minimal-match (message))
;;                           " at " (file-name) " line " line
;;                           (or "." (and ", " (zero-or-more not-newline)))
;;                           line-end))
;;   :modes (perl-mode cperl-mode))

;; (add-hook 'cperl-mode-hook
;;           (lambda ()
;;             (flycheck-mode t)
;;             (setq flycheck-checker 'perl-auto-carton)))
;; (add-hook 'perl-mode-hook
;;           (lambda ()
;;             (flycheck-mode t)
;;             (setq flycheck-checker 'perl-auto-carton)))
