(unless (boundp 'notiffany-original-background) (setq notiffany-original-background (face-background 'mode-line)))
(unless (boundp 'notiffany-original-foreground) (setq notiffany-original-foreground (face-foreground 'mode-line)))
(defun reset-mode-line
    (set-face-attribute 'mode-line nil
                        :background notiffany-original-background
                        :foreground notiffany-original-foreground))
