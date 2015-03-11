;;; init.el --- Alex Broekhof
;;; Commentary:
;;; A Emacs configuration based on use-package, written in org-mode

;;; Code:
;;; initalize all ELPA packages
(require 'package)

; list the repositories containing them
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

; activate all the packages (in particular autoloads)
(package-initialize)

; install use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

(use-package org
  :ensure t)

;; load the org file containing settings
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(provide 'init)
;;; init.el ends here

