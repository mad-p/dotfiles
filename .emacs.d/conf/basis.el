
(display-time)

(auto-compression-mode 1)

(fmakunbound 'gomoku) ;; so that go-l completes to goto-line

(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq inhibit-startup-message t
      line-number-mode nil
      enable-recursive-minibuffers t
      window-min-height 2
      backup-by-copying-when-linked t
      default-fill-column 64
      Info-enable-edit nil
      gnus-novice-user nil
      next-line-add-newlines t
      eval-expression-print-length nil
      eval-expression-print-level nil
      visible-bell (eq (window-system) 'x)
      split-width-threshold nil
      transient-mark-mode nil
      )
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)

(and (fboundp 'partial-completion-mode) (partial-completion-mode t))

;(quietly-read-abbrev-file nil)

(add-to-list 'completion-ignored-extensions ".svn/")
(setq completion-ignored-extensions (remove ".log" completion-ignored-extensions))

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(load "server")
(unless (server-running-p) (server-start))

(global-auto-revert-mode 1)
(setq auto-revert-interval 10)
(setq auto-revert-check-vc-info t)
