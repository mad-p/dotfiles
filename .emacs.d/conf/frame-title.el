(let ((dirname (save-excursion
                 (set-buffer "*scratch*")
                 default-directory)))
  (if (string= (expand-file-name dirname) (expand-file-name "~"))
      ()
    (let ((basename (file-name-nondirectory (substring dirname 0 (1- (length dirname))))))
      (setq frame-title-format (concat basename " : %b")))))

(defun purge-bogus-frames ()
  (interactive)
  (mapcar #'(lambda (frame) (delete-frame frame))
          (filtered-frame-list
           #'(lambda (frame)
               (and (< (frame-parameter frame 'height) 2)
                    (< (frame-parameter frame 'width) 30)
                    (frame-parameter frame 'visibility))))))
