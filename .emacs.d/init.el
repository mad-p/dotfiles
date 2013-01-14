;;-------------------------------------------------;;
;; load-path configuration
;;-------------------------------------------------;;
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
	   (add-to-list 'load-path path))
	(mapcar 'expand-file-name paths)))
(add-to-load-path "~/.emacs.d/auto-install" "~/.emacs.d/elisp" "~/.emacs.d/my-elisp")
;;-------------------------------------------------;;
(load "~/.emacs.d/conf/conf-auto-install")
(load "~/.emacs.d/conf/conf-anything")
(load "~/.emacs.d/conf/basis")
(load "~/.emacs.d/conf/calc")
(load "~/.emacs.d/conf/fonts")
(load "~/.emacs.d/conf/bindings")
(load "~/.emacs.d/conf/macosx")
(load "~/.emacs.d/conf/tcode")
(load "~/.emacs.d/conf/navi2ch")
;;-------------------------------------------------;;
(put 'set-goal-column 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(indent-tabs-mode nil)
 '(line-number-mode nil)
 '(recentf-max-saved-items 50)
 '(safe-local-variable-values (quote ((charset . utf-8) (encoding . utf-8))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-mode nil)
 '(view-read-only t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
