(let ((dirname (save-excursion
                 (set-buffer "*scratch*")
                 default-directory)))
  (if (string= (expand-file-name dirname) (expand-file-name "~"))
      ()
    (let ((basename (file-name-nondirectory (substring dirname 0 (1- (length dirname))))))
      (setq frame-title-format (concat basename " : %b")))))
