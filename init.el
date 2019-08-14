;;; init.el --- Alex Broekhof
;;; Commentary:
;;; A Emacs configuration based on use-package, written in org-mode

;;; Code:
;;; initalize all ELPA packages
(eval-when-compile
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (package-install 'diminish)
    (package-install 'bind-key))

  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)

  (require 'use-package))
(require 'diminish)
(require 'bind-key)

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
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "61724add6ddc09a0426f6b39109a76dd83174cf36d76563d3a35c7e07c0753c6" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" default)))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (git-gutter neotree doom-themes adaptive-wrap zenburn-theme web-mode volatile-highlights virtualenvwrapper use-package undo-tree switch-window smartparens rainbow-delimiters paradox multiple-cursors magit js2-mode helm-themes helm-swoop helm-projectile helm-descbinds helm-ag guide-key flycheck exec-path-from-shell diff-hl csv-mode company-anaconda buffer-move anzu)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838"))))
