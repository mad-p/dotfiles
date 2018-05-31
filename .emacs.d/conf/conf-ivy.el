(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 10)
(setq ivy-extra-directories '("./"))
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(defconst counsel-find-file-ignore-regexp (regexp-opt '("../")))
