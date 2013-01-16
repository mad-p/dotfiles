;; -*- emacs-lisp -*-

(cond ((eq (window-system) 'x)
       (add-to-list 'default-frame-alist '(font . "ricty-14:weight=normal:spacing=0"))
       )
      ((eq (window-system) 'ns)
       (set-face-attribute 'default nil :family "Ricty" :height 160)
       (set-fontset-font nil 'japanese-jisx0208        '("Ricty" . "iso10646-*"))
       (set-fontset-font nil 'japanese-jisx0213.2004-1 '("Ricty" . "iso10646-*"))
       (set-fontset-font nil 'japanese-jisx0213-2      '("Ricty" . "iso10646-*"))
       )
      )
