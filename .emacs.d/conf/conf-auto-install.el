(setq auto-install-wget-command
      (cond ((file-executable-p "/usr/local/bin/wget") "/usr/local/bin/wget")
            ((file-executable-p "/usr/bin/wget") "/usr/bin/wget")))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
