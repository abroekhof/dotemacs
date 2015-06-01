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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("61724add6ddc09a0426f6b39109a76dd83174cf36d76563d3a35c7e07c0753c6" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" default)))
 '(magit-use-overlays nil)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
