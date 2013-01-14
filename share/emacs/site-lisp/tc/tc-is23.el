;;; tc-is23.el --- T-Code isearch modification for Emacs 23.*.

;; Copyright (C) 1994,97-2001,2005,2010 Kaoru Maeda, Mikihiko Nakao, KITAJIMA Akira and Masayuki Ataka

;; Author: Kaoru Maeda <maeda@src.ricoh.co.jp>
;;	Mikihiko Nakao
;;	KITAJIMA Akira <kitajima@isc.osakac.ac.jp>
;;      Masayuki Ataka <ataka@milk.freemail.ne.jp>
;; Maintainer: Kaoru Maeda
;; Create: 20 Jun 2010

;; $Id: $

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.

;;; Code:

(if (< (string-to-int emacs-version) 23)
    (error "tc-is22 cannot run on NEmacs/Mule/Emacs20/21/22.  Use Emacs 23 or later!"))

;;; This file contains only diffs to tc-is22.el
(require 'tc-is22)

;;; Emacs 23 isearch-repeat is ready to go
(defun isearch-repeat (direction)
  ;; Utility for isearch-repeat-forward and -backward.
  (if (eq isearch-forward (eq direction 'forward))
      ;; C-s in forward or C-r in reverse.
      (if (equal isearch-string "")
	  ;; If search string is empty, use last one.
	  (if (null (if isearch-regexp regexp-search-ring search-ring))
	      (setq isearch-error "No previous search string")
	    (setq isearch-string
		  (if isearch-regexp
		      (car regexp-search-ring)
		    (car search-ring))
		  isearch-message
		  (mapconcat 'isearch-text-char-description
			     (tcode-isearch-remove-ignore-regexp isearch-string)
			     "")
		  isearch-case-fold-search isearch-last-case-fold-search))
	;; If already have what to search for, repeat it.
	(or isearch-success
	    (progn
	      ;; Set isearch-wrapped before calling isearch-wrap-function
	      (setq isearch-wrapped t)
	      (if isearch-wrap-function
		  (funcall isearch-wrap-function)
	        (goto-char (if isearch-forward (point-min) (point-max)))))))
    ;; C-s in reverse or C-r in forward, change direction.
    (setq isearch-forward (not isearch-forward)
	  isearch-success t))

  (setq isearch-barrier (point)) ; For subsequent \| if regexp.

  (if (equal isearch-string "")
      (setq isearch-success t)
    (if (and isearch-success
	     (equal (point) isearch-other-end)
	     (not isearch-just-started))
	;; If repeating a search that found
	;; an empty string, ensure we advance.
	(if (if isearch-forward (eobp) (bobp))
	    ;; If there's nowhere to advance to, fail (and wrap next time).
	    (progn
	      (setq isearch-success nil)
	      (ding))
	  (forward-char (if isearch-forward 1 -1))
	  (isearch-search))
      (isearch-search)))

  (isearch-push-state)
  (isearch-update))

(provide 'tc-is23)

;;; tc-is23.el ends here
