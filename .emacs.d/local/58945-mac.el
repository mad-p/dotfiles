(load "~/.emacs.d/conf/edit_with_emacs")
(setq ispell-program-name "/usr/local/bin/aspell")
(defun highlight-copyrights ()
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let ((case-fold-search t))
        (highlight-regexp "[Cc]opyright\\|COPYRIGHT\\|[Ll]icense\\|LICENSE\\|[Nn]otice\\|NOTICE\\|[Oo]riginal" 'hi-pink)
        (highlight-regexp "GNU\\|gnu\\|GPL\\|gpl" 'hi-aquamarine)
        (highlight-regexp "[Aa]uthor\\|[Cc]opied\\|[Cc]reated\\|[Dd]erived\\|[Dd]eveloped\\|[Dd]evelopped\\|[Mm]odified" 'hi-green)
        (highlight-regexp "stackoverflow\\|github" 'hi-yellow)
        (highlight-regexp ":diff --git.*$" (quote hi-green))
        ))))
(defun occur-copyrights ()
  (interactive)
  (occur
   (concat
    "[Cc]opyright\\|COPYRIGHT\\|[Ll]icense\\|LICENSE\\|[Nn]otice\\|NOTICE\\|[Oo]riginal\\|GNU\\|gnu\\|GPL\\|gpl" "\\|"
    "[Aa]uthor\\|[Cc]opied\\|[Cc]reated\\|[Dd]erived\\|[Dd]eveloped\\|[Dd]evelopped\\|[Mm]odified" "\\|"
    "stackoverflow\\|github"
    )))
