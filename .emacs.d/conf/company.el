(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 1) ; デフォルトは0.5
(setq company-minimum-prefix-length 4) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(defun my-dabbrev (arg)
  (interactive "P")
  (if arg
      (dabbrev-expand arg)
    (company-complete)))
(global-set-key (kbd "M-/") 'my-dabbrev)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-t") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-previous)
(define-key company-search-map (kbd "C-t") 'company-select-next)
(define-key company-search-map (kbd "C-n") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
(define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map (kbd "C-f") 'company-complete-selection) ;; C-fで候補を設定
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
