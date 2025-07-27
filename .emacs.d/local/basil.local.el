(defun img ()
  (interactive "*")
  (save-excursion
    (while (re-search-forward "!\\([^ \n]+\\) \\(.*\\)" nil t)
      (replace-match
       (concat
        "<a href=\"/kaidoku/images/"
        (match-string 1)
        "\"><img width=\"200px\" src=\"/kaidoku/images/"
        (match-string 1)
        "\"/><br/>"
        (match-string 2)
        "</a><br/>")))))
