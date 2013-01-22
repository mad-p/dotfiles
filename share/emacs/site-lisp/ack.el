;; http://d.hatena.ne.jp/kitokitoki/20090228/1235807272
(defvar ack-switches " --flush --nopager --nocolor --nogroup --ignore-dir=test --ignore-dir=tmp --ignore-dir=jsdoc --ignore-dir=vendor ")
(defvar ack-command
  (if (getenv "PERLBREW_ROOT")
      (concat (getenv "PERLBREW_ROOT") "/perls/" (getenv "PERLBREW_PERL") "/bin/ack")
    "/usr/local/bin/ack"))
(defun ack ()
  (interactive)
  (let* ((grep-find-command (concat ack-command ack-switches)))
    (call-interactively 'grep-find)))
(add-hook 'grep-mode-hook
          '(lambda ()
              (setq buffer-file-coding-system 'utf-8)))

(provide 'ack)
