;;;-------------------------------------------------;;;
;;; load-path configuration
;;;-------------------------------------------------;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
	   (add-to-list 'load-path path))
	(mapcar 'expand-file-name paths)))
(add-to-load-path "~/.emacs.d/auto-install" "~/.emacs.d/elisp" "~/.emacs.d/my-elisp" "~/share/emacs/site-lisp")
;;-------------------------------------------------;;
(load "~/.emacs.d/conf/frame-title.el")
(load "~/.emacs.d/conf/conf-auto-install")
(load "~/.emacs.d/conf/conf-ivy")
(load "~/.emacs.d/conf/lsp")
(load "~/.emacs.d/conf/conf-anything")
(load "~/.emacs.d/conf/basis")
(load "~/.emacs.d/conf/calc")
(load "~/.emacs.d/conf/highlight-indentation")
(load "~/.emacs.d/conf/bindings")
(load "~/.emacs.d/conf/tcode")
(load "~/.emacs.d/conf/grep")
(load "~/.emacs.d/conf/guard")
;;(load "~/.emacs.d/conf/jslint")
(load "~/.emacs.d/conf/perlbrew")
(load "~/.emacs.d/conf/programming")
(load "~/.emacs.d/conf/tempbuf")
(load "~/.emacs.d/conf/fonts")
(load "~/.emacs.d/conf/company")
(load "~/.emacs.d/conf/w32")
(load "~/.emacs.d/conf/macosx")
(let* ((host (system-name))
       (file (concat "~/.emacs.d/local/" host ".el")))
  (if (file-exists-p file)
      (load file)))
;;-------------------------------------------------;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-name-width 35)
 '(calendar-date-display-form (quote (year "/" month "/" day)))
 '(calendar-time-display-form
   (quote
    (24-hours ":" minutes
              (if time-zone " (")
              time-zone
              (if time-zone ")"))) t)
 '(cperl-comment-column 40)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-regexp-indent-step 2)
 '(desktop-path (quote ("." "~/.emacs.d/" "~")))
 '(desktop-save-mode t)
 '(diff-switches "-u")
 '(display-time-mode t)
 '(edit-server-new-frame-alist
   (quote
    ((name . "Edit with Emacs FRAME")
     (width . 96)
     (height . 32)
     (minibuffer . t)
     (menu-bar-lines . t))))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-auto-indent-flag t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-electric-keys (quote ("}" ")")))
 '(js2-enter-indents-newline t)
 '(js2-mirror-mode nil)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-escape-quotes nil)
 '(js2-mode-indent-ignore-first-tab nil)
 '(js2-rebind-eol-bol-keys nil)
 '(js2-strict-trailing-comma-warning nil)
 '(json-mode-indent-level 2)
 '(line-number-mode nil)
 '(lsp-ui-flycheck-enable nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(package-selected-packages
   (quote
    (typescript-mode markdown-mode+ counsel-dash company-lsp lsp-mode counsel ivy company scala-mode markdown-mode groovy-mode editorconfig use-package json-mode flycheck)))
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(safe-local-variable-values (quote ((charset . utf-8) (encoding . utf-8))))
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(tempbuf-minimum-timeout 60)
 '(tool-bar-mode nil)
 '(tramp-mode nil)
 '(transient-mark-mode nil)
 '(typescript-indent-level 2)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(view-read-only t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-nonoverridable-face ((((class color) (background light)) (:foreground "dark green"))))
 '(cursor ((t (:background "black" :underline t))))
 '(font-lock-builtin-face ((((class color) (background light)) (:foreground "dark green" :underline t))))
 '(font-lock-comment-face ((((class color) (background light)) (:background "gray80"))))
 '(font-lock-constant-face ((((class color) (background light)) (:foreground "blue"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "royalblue4" :underline t))))
 '(font-lock-string-face ((((class color) (background light)) (:background "pink"))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "dark green"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "brown"))))
 '(highlight-indentation-current-column-face ((t (:background "antiquewhite3"))))
 '(highlight-indentation-face ((t (:background "antiquewhite"))))
 '(lsp-ui-sideline-code-action ((t (:foreground "dark green"))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "black" :box (:line-width -1 :color "white") :weight ultra-bold :height 0.99))))
 '(lsp-ui-sideline-global ((t (:background "thistle1"))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey40" :box (:line-width -1 :color "grey40") :height 0.99))))
 '(markdown-inline-code-face ((t (:inherit font-lock-type-face))))
 '(markdown-pre-face ((t (:inherit font-lock-type-face))))
 '(message-header-subject-face ((t (:background "light blue" :weight bold))) t)
 '(message-header-to-face ((t (:background "lavender" :weight bold))) t)
 '(trailing-whitespace ((((class color) (background light)) (:background "red")))))

(provide 'init)
;;; init.el ends here
