;;
;; Emacs Utility Mode Bindings
;;

(load "wordhacks")

;; exchange Ctrl-H and Delete
(keyboard-translate ?\C-h ?\C-?)
(keyboard-translate ?\C-? ?\C-h)
(keyboard-translate ?\210 ?\377)
(keyboard-translate ?\377 ?\210)

;;
;; Global Bindings
;;

(define-key global-map "\e\e" 'eval-expression)
(define-key global-map "\^m" 'newline-and-indent)
(define-key global-map "\^t" 'next-line)
(define-key global-map "\e\^t" 'forward-list)
(define-key global-map "\^n" 'previous-line)
(define-key global-map "\e\^n" 'backward-list)
(define-key global-map "\e\^l" 'forward-sexp)
(define-key global-map "\e\^h" 'backward-kill-word)
(define-key global-map "\^l" 'forward-char)
;(define-key global-map "\el" 'forward-word)
(define-key global-map "\el" 'forward-word-stop-at-uppercase)
(define-key global-map "\eb" 'backward-word-stop-at-uppercase)
(define-key global-map "\ed" 'kill-word-stop-at-uppercase)
(define-key esc-map "\177" 'backward-kill-word-stop-at-uppercase)
(global-set-key [C-delete]   'backward-kill-word-word-stop-at-uppercase)
(define-key global-map [C-delete] 'backward-kill-word-stop-at-uppercase)
(define-key global-map [C-M-delete] 'backward-kill-word-stop-at-uppercase)
(define-key global-map [C-M-backspace] 'backward-kill-word-stop-at-uppercase)
(define-key global-map [(control meta h)] 'backward-kill-word-stop-at-uppercase)
(define-key global-map "\^d" 'recenter) ;;(tcode-transpose-strokes)
(define-key global-map "\^f" 'delete-char)
(define-key global-map "\ef" 'downcase-word-hack)
;(define-key global-map "\ef" 'downcase-word)
(define-key global-map "\^p" 'universal-argument)
(define-key universal-argument-map "\^p" 'universal-argument-more)
(define-key global-map "\ep" 'lisp-complete-symbol)
(define-key global-map "\^q" 'scroll-up)
(define-key global-map "\eq" 'scroll-down)
(define-key global-map "\e\^q" 'scroll-other-window)
(define-key global-map "\e\^r" 'isearch-backward-regexp)
(define-key global-map "\^u" 'kill-region)
(define-key global-map "\eu" 'copy-region-as-kill)
(define-key global-map "\^v" 'other-window)
(define-key global-map "\ev" 'fill-paragraph)
(define-key global-map "\^w" 'quoted-insert)
(define-key global-map "\ew" 'upcase-word-hack)
;(define-key global-map "\ew" 'upcase-word)
(define-key global-map "\^z" 'toggle-input-method)
(define-key global-map "\^xc" 'compile)
;(define-key global-map "\^x\^i" 'rmail-input)
(define-key global-map "\e?" 'help-command)
(define-key global-map "\e&" 'query-replace-regexp)
(define-key global-map "\ec" 'capitalize-word-hack)
;(define-key global-map "\ec" 'capitalize-word)

;; definition of *-word-hack are found in ~/emacs/mylisp/myfns.el

(global-unset-key "\e[")
(global-set-key "\e[11~" 'next-line)
(global-set-key "\e[12~" 'next-line)
(global-set-key "\e[13~" 'next-line)
(global-set-key "\e[14~" 'previous-line)
(global-set-key "\e[18~" 'call-last-kbd-macro)

(let ((keymap (make-sparse-keymap)))
  (define-key global-map "\^xt" keymap)
  (define-key global-map "\^x\^t" keymap)
  (define-key global-map "\^ct" keymap))
;(define-key global-map "\^ctg" 'gnus)
;(define-key global-map "\^ctm" 'mail)
;(define-key global-map "\^ctr" 'wl)
;(define-key global-map "\^cti" 'info)
;(define-key global-map "\^cty" 'yahn)

(define-key global-map "\^cro" 'open-rectangle)
(define-key global-map "\^crc" 'clear-rectangle)
(define-key global-map "\^crd" 'delete-rectangle)
(define-key global-map "\^crk" 'kill-rectangle)
(define-key global-map "\^cry" 'yank-rectangle)
(define-key global-map "\^crr" 'copy-rectangle-to-register)
(define-key global-map "\C-cd" 'lookup-pattern)
;(define-key global-map "\C-cn" 'number-region)
;(define-key global-map "\C-cl" 'my-latex-map)
(define-key global-map "\C-cw" 'ispell-word)
;(define-key global-map "\C-cv" 'kaoru-word-vbar)
;(define-key global-map "\C-c|" 'quote-bar-region)
(define-key global-map "\C-cj" 'anything-c-pp-bookmarks)
(define-key global-map "\C-xj" 'anything-c-pp-bookmarks)
(define-key global-map "\C-ca" 'ack)

(find-function-setup-keys)

(define-key global-map [f1] 'next-error)
(define-key global-map [f2] 'call-last-kbd-macro)
;(define-key global-map [f4] 'zenkaku-region)
;(define-key global-map [f5] 'hankaku-region)
(define-key global-map [f10] 'hilit-rehighlight-buffer)
(define-key global-map [f11] 'help-command)

(define-key global-map [insert] (lookup-key global-map "\C-ct"))
;(define-key global-map [end] 'execute-extended-command)
(define-key global-map "\eu" 'kill-ring-save)
(define-key global-map "\C-x\C-q" 'read-only-mode)
(define-key global-map [S-tab] 'other-frame)
(define-key global-map [S-iso-lefttab] 'other-frame)
(define-key global-map [S-right] 'other-frame)
(define-key global-map [C-tab] 'other-frame)
(define-key global-map [C-iso-lefttab] 'other-frame)
(define-key global-map [C-S-tab] 'other-frame)
(define-key global-map [C-S-iso-lefttab] 'other-frame)
(global-unset-key "\C-x\e")
(define-key global-map "\C-x\e" 'repeat-complex-command)
(global-unset-key "\C-cr")
(define-key global-map "\C-cr" (lookup-key global-map "\^xr"))
(define-key global-map "\C-ctk" 'keisen-mode)
(define-key global-map "\C-]" 'toggle-tcode-mode)
(define-key global-map [?\C-\M-,] 'beginning-of-buffer)
(define-key global-map [?\C-\M-.] 'end-of-buffer)
(define-key global-map [?\C-<] 'beginning-of-buffer)
(define-key global-map [?\C->] 'end-of-buffer)
(define-key global-map [?\C-\]] 'toggle-tcode-mode)

(define-key global-map "\C-cl" 'align)
(define-key global-map "\C-cn" 'align-regexp)

(define-key emacs-lisp-mode-map "\eq" 'scroll-down)
(define-key lisp-interaction-mode-map "\eq" 'scroll-down)
(define-key emacs-lisp-mode-map "\e\^x" 'eval-defvar-as-defconst)
(define-key lisp-interaction-mode-map "\e\^x" 'eval-defvar-as-defconst)

;;
;; Dired
;;
(setq dired-listing-switches "-alF"
      dired-garbage-files-regexp "\\.log$\\|\\.toc$\\|\\.dvi$\\|\\.bak$\\|\\.orig$\\|\\.rej$\\|~$\\|svn-commit.tmp$"
      )
(add-hook 'dired-mode-hook
	  #'(lambda ()
	      (define-key dired-mode-map "\C-d" 'recenter)
	      (define-key dired-mode-map " " 'scroll-up)
	      (define-key dired-mode-map "\C-m" 'scroll-down)
	      (define-key dired-mode-map "t" 'dired-next-line)
	      (define-key dired-mode-map "n" 'dired-previous-line)
	      (define-key dired-mode-map "r" #'(lambda () (interactive) (find-file-read-only-other-window (dired-get-file-for-visit))))
	      (define-key dired-mode-map "\^t" 'dired-next-line)
	      (define-key dired-mode-map "\^n" 'dired-previous-line)
	      (define-key dired-mode-map "h" 'dired-hide-subdir)
	      (define-key dired-mode-map "H" 'dired-hide-all)
	      (define-key dired-mode-map "q" 'dired-bury-buffer)
	      (define-key dired-mode-map "Q" 'dired-kill-buffer)
	      (define-key dired-mode-map "K" #'(lambda () (interactive) (dired-do-kill-lines 1)))
	      (define-key dired-mode-map "E" 'dired-do-find-file)
	      (define-key dired-mode-map "F" 'dired-do-find-file)
	      ))

;;
;; Buffer Menu Mode
;;
(define-key Buffer-menu-mode-map "t" 'next-line)
(define-key Buffer-menu-mode-map "n" 'previous-line)
(define-key Buffer-menu-mode-map "\C-k" 'previous-line)
(define-key Buffer-menu-mode-map "%" 'Buffer-menu-toggle-read-only)
(define-key Buffer-menu-mode-map "e" 'Buffer-menu-eval)

;;
;; View mode
(require 'view)
;;(define-key view-mode-map "\^u" 'View-undefined)
(define-key view-mode-map "\^v" 'other-window)
(define-key view-mode-map "\^l" 'forward-char)
(define-key view-mode-map "\^n" 'previous-line)
(define-key view-mode-map "\^t" 'next-line)
(define-key view-mode-map "\^q" 'View-scroll-page-forward)
(define-key view-mode-map "\eq" 'View-scroll-page-backward)
;;(define-key view-mode-map "\^p" 'universal-argument)
(define-key view-mode-map "t" 'View-scroll-line-forward)
(define-key view-mode-map "n" 'View-scroll-line-backward)
(add-hook 'view-mode-hook #'(lambda () (setq view-mode-auto-exit nil)))

;; Make C-M-h backword-kill-word
(defun check-bindings ()
  (define-key (current-local-map) (kbd "C-d") 'recenter)
  (let ((cmd (lookup-key (current-local-map) (kbd "C-M-h"))))
    (if (and (symbolp cmd) (not (eq cmd 'backward-kill-word-stop-at-uppercase)))
        (define-key (current-local-map) (kbd "C-M-h") 'backward-kill-word-stop-at-uppercase))))

(mapc #'(lambda (hook) (add-hook hook 'check-bindings))
      '(java-mode-hook c-mode-hook c++-mode-hook ruby-mode-hook groovy-mode-hook))

;;
;; Diff mode
(add-hook 'diff-mode-hook
          #'(lambda ()
              (define-key diff-mode-map (kbd "M-q") 'scroll-down)))
