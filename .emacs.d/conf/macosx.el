(cond ((eq window-system 'ns)
       ;; MacUIM
       ;;(setq default-input-method "MacOSX")
       ;;(mac-add-key-passed-to-system '(shift ? ))

       ;; Command-Key and Option-Key
       (setq ns-command-modifier 'meta)
       (setq ns-alternate-modifier 'meta)

       ;; frame size
       (modify-frame-parameters (selected-frame) '((width . 96) (height . 36)))
       )
      ((eq window-system 'x)
       (modify-frame-parameters (selected-frame) '((width . 96) (height . 36))))
      )
