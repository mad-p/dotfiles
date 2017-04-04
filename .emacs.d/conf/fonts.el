;; -*- emacs-lisp -*-

(cond ((eq (window-system) 'x)
       (add-to-list 'default-frame-alist '(font . "ricty-14:weight=normal:spacing=0"))
       )
      ((eq (window-system) 'ns)
       (set-face-attribute 'default nil :family "Ricty Diminished" :height 180)
       (set-fontset-font nil 'japanese-jisx0208        '("Ricty Diminished" . "iso10646-*"))
       (set-fontset-font nil 'japanese-jisx0213.2004-1 '("Ricty Diminished" . "iso10646-*"))
       (set-fontset-font nil 'japanese-jisx0213-2      '("Ricty Diminished" . "iso10646-*"))
       )
      )
