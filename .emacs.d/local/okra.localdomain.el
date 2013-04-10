;(if (eq (window-system) 'x)
;    (setcdr (assoc 'font default-frame-alist) "-jis-fixed-medium-r-normal--16-*-*-*-*-*-*-*"))
(modify-frame-parameters (selected-frame) '((width . 120) (height . 50)))
