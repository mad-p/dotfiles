(custom-set-variables
 '(edit-server-new-frame-alist (quote ((name . "Edit with Emacs FRAME") (width . 96) (height . 32) (minibuffer . t) (menu-bar-lines . t))))
)
(require 'edit-server)
(edit-server-start)
