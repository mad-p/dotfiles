;;-------------------------------------------------;;
;; load-path configuration
;;-------------------------------------------------;;
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
	   (add-to-list 'load-path path))
	(mapcar 'expand-file-name paths)))
(add-to-load-path "~/.emacs.d/auto-install" "~/.emacs.d/elisp" "~/.emacs.d/my-elisp" "~/share/emacs/site-lisp")
;;-------------------------------------------------;;
(load "~/.emacs.d/conf/conf-auto-install")
(load "~/.emacs.d/conf/conf-anything")
(load "~/.emacs.d/conf/basis")
(load "~/.emacs.d/conf/calc")
(load "~/.emacs.d/conf/highlight-indentation")
(load "~/.emacs.d/conf/bindings")
(load "~/.emacs.d/conf/tcode")
(load "~/.emacs.d/conf/grep")
(load "~/.emacs.d/conf/programming")
(load "~/.emacs.d/conf/tempbuf")
(load "~/.emacs.d/conf/fonts")
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
 '(line-number-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(safe-local-variable-values
   (quote
    ((eval highlight-regexp "^[^	]+	[^	]+	[^	]+$\\|^[^	]+	[^	]+$"
           (quote hi-pink))
     (eval highlight-regexp "^[^	]+	[^	]+	[^	]+$\\|^[^	]+	[^	]+$"
           (quote hi-yellow))
     (eval local-set-key "	"
           (quote self-insert-command))
     (charset . utf-8)
     (encoding . utf-8))))
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(tempbuf-minimum-timeout 60)
 '(tool-bar-mode nil)
 '(tramp-mode nil)
 '(transient-mark-mode nil)
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
 '(message-header-subject-face ((t (:background "light blue" :weight bold))) t)
 '(message-header-to-face ((t (:background "lavender" :weight bold))) t)
 '(trailing-whitespace ((((class color) (background light)) (:background "red")))))
