(cond ((eq window-system 'ns)
       ;; MacUIM
       ;;(setq default-input-method "MacOSX")
       ;;(mac-add-key-passed-to-system '(shift ? ))

       ;; Command-Key and Option-Key
       (setq ns-command-modifier 'meta)
       (setq ns-alternate-modifier 'meta)

       ;; frame size
       (modify-frame-parameters (selected-frame) '((width . 96) (height . 36)))
       (custom-set-variables
        '(mouse-wheel-progressive-speed nil)
        '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control))))))

       ;; turn-around visible-bell glitches
       (setq visible-bell nil)
       (setq ring-bell-function (lambda ()
                                  (invert-face 'mode-line)
                                  (run-with-timer 0.1 nil 'invert-face 'mode-line)))
       )

      ((eq window-system 'x)
       (modify-frame-parameters (selected-frame) '((width . 96) (height . 36)))
       (custom-set-variables
        '(mouse-wheel-progressive-speed nil)
        '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control))))))
       )
      )
(setq ispell-program-name
      (cond ((file-executable-p "/usr/local/bin/aspell") "/usr/local/bin/aspell")
            ((file-executable-p "/opt/homebrew/bin/aspell") "/opt/homebrew/bin/aspell")))
(setenv "LANG" "C")
