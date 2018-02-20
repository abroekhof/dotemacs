<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Initialization</a>
<ul>
<li><a href="#sec-1-1">1.1. Make sure Emacs uses the shell PATH</a></li>
</ul>
</li>
<li><a href="#sec-2">2. Editor behavior</a>
<ul>
<li><a href="#sec-2-1">2.1. Get rid of tabs</a></li>
<li><a href="#sec-2-2">2.2. Delete the selection with a keypress</a></li>
<li><a href="#sec-2-3">2.3. Revert buffers automatically when underlying files are changed externally</a></li>
<li><a href="#sec-2-4">2.4. Hippie expand settings</a></li>
<li><a href="#sec-2-5">2.5. Better scrolling</a></li>
<li><a href="#sec-2-6">2.6. Enable y/n answers</a></li>
<li><a href="#sec-2-7">2.7. Smart Parentheses</a></li>
<li><a href="#sec-2-8">2.8. Uniquify</a></li>
<li><a href="#sec-2-9">2.9. Saveplace remembers your location in a file when saving files</a></li>
<li><a href="#sec-2-10">2.10. Save recent files</a></li>
<li><a href="#sec-2-11">2.11. Savehist keeps track of some history</a></li>
<li><a href="#sec-2-12">2.12. Backups</a></li>
<li><a href="#sec-2-13">2.13. Save desktop</a></li>
<li><a href="#sec-2-14">2.14. Multiple Cursors</a></li>
<li><a href="#sec-2-15">2.15. OSX Behavior</a></li>
<li><a href="#sec-2-16">2.16. C/C++ Behavior</a></li>
<li><a href="#sec-2-17">2.17. Avy (navigation)</a></li>
</ul>
</li>
<li><a href="#sec-3">3. UI settings</a>
<ul>
<li><a href="#sec-3-1">3.1. Font</a></li>
<li><a href="#sec-3-2">3.2. Turn off the scroll bar and the tool bar and the menu bar.</a></li>
<li><a href="#sec-3-3">3.3. Use a nice theme</a></li>
<li><a href="#sec-3-4">3.4. Turn on blinking cursor</a></li>
<li><a href="#sec-3-5">3.5. Highlight current line</a></li>
<li><a href="#sec-3-6">3.6. Diminish</a></li>
<li><a href="#sec-3-7">3.7. Rainbow delimiters</a></li>
<li><a href="#sec-3-8">3.8. Smart Mode Line</a></li>
</ul>
</li>
<li><a href="#sec-4">4. Org settings</a>
<ul>
<li><a href="#sec-4-1">4.1. Make sure that code is highlighted properly in org files</a></li>
</ul>
</li>
<li><a href="#sec-5">5. Anzu replace</a></li>
<li><a href="#sec-6">6. Undo tree</a></li>
<li><a href="#sec-7">7. Switch window</a></li>
<li><a href="#sec-8">8. Version control</a>
<ul>
<li><a href="#sec-8-1">8.1. Magit</a></li>
<li><a href="#sec-8-2">8.2. Git Gutter</a></li>
</ul>
</li>
<li><a href="#sec-9">9. Projectile</a></li>
<li><a href="#sec-10">10. Helm</a>
<ul>
<li><a href="#sec-10-1">10.1. Helm configurations</a></li>
<li><a href="#sec-10-2">10.2. Helm gtags</a></li>
<li><a href="#sec-10-3">10.3. Helm swoop</a></li>
</ul>
</li>
<li><a href="#sec-11">11. Company</a></li>
<li><a href="#sec-12">12. Guide key</a></li>
<li><a href="#sec-13">13. Package list</a></li>
<li><a href="#sec-14">14. Buffer moving</a></li>
<li><a href="#sec-15">15. Programming modes</a>
<ul>
<li><a href="#sec-15-1">15.1. Protocol Buffers</a></li>
<li><a href="#sec-15-2">15.2. Makefiles</a></li>
</ul>
</li>
</ul>
</div>
</div>

# Initialization<a id="sec-1" name="sec-1"></a>

## Make sure Emacs uses the shell PATH<a id="sec-1-1" name="sec-1-1"></a>

    (when (memq window-system '(mac ns))
      (use-package exec-path-from-shell
        :ensure t
        :config (exec-path-from-shell-initialize)))

# Editor behavior<a id="sec-2" name="sec-2"></a>

## Get rid of tabs<a id="sec-2-1" name="sec-2-1"></a>

    (setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
    (setq-default tab-width 8)            ;; but maintain correct appearance

## Delete the selection with a keypress<a id="sec-2-2" name="sec-2-2"></a>

    (delete-selection-mode t)

## Revert buffers automatically when underlying files are changed externally<a id="sec-2-3" name="sec-2-3"></a>

    (global-auto-revert-mode t)

## Hippie expand settings<a id="sec-2-4" name="sec-2-4"></a>

    (use-package hippie-exp
      :ensure t
      :bind ("M-/" . hippie-expand)
      :init (setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                                     try-expand-dabbrev-all-buffers
                                                     try-expand-dabbrev-from-kill
                                                     try-complete-file-name-partially
                                                     try-complete-file-name
                                                     try-expand-all-abbrevs
                                                     try-expand-list
                                                     try-expand-line
                                                     try-complete-lisp-symbol-partially
                                                     try-complete-lisp-symbol)))

## Better scrolling<a id="sec-2-5" name="sec-2-5"></a>

    (setq scroll-margin 0
          scroll-conservatively 100000
          scroll-preserve-screen-position 1)

## Enable y/n answers<a id="sec-2-6" name="sec-2-6"></a>

    (fset 'yes-or-no-p 'y-or-n-p)

## Smart Parentheses<a id="sec-2-7" name="sec-2-7"></a>

    (use-package smartparens-config
      :init (progn
              (smartparens-global-mode 1)
              (show-smartparens-global-mode 1))
      :ensure smartparens
      :diminish smartparens-mode)

## Uniquify<a id="sec-2-8" name="sec-2-8"></a>

    (use-package uniquify
      :init(progn(setq uniquify-buffer-name-style 'forward)
                 (setq uniquify-separator "/")
                 (setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
                 (setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
                 )
      )

## Saveplace remembers your location in a file when saving files<a id="sec-2-9" name="sec-2-9"></a>

    (use-package saveplace
      :init (setq-default save-place t)
      )

## Save recent files<a id="sec-2-10" name="sec-2-10"></a>

    (use-package recentf
      :init (progn(setq recentf-max-saved-items 500
                        recentf-max-menu-items 15)
                  (recentf-mode +1))
      :ensure t)

## Savehist keeps track of some history<a id="sec-2-11" name="sec-2-11"></a>

    (use-package savehist
      :init
      (progn
        (setq savehist-file "~/.emacs.d/savehist")
        (setq savehist-additional-variables '(search-ring regexp-search-ring)
              savehist-autosave-interval 60
              history-length t
              history-delete-duplicates t
              savehist-save-minibuffer-history 1)
        (savehist-mode +1)))

## Backups<a id="sec-2-12" name="sec-2-12"></a>

Borrowed from Sacha Chua
<https://github.com/sachac/.emacs.d/>

This is one of the things people usually want to change right away. By default, Emacs saves backup files in the current directory. These are the files ending in `~` that are cluttering up your directory lists. The following code stashes them all in `~/.emacs.d/backups`, where I can find them with `C-x C-f` (`find-file`) if I really need to.

    (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

Disk space is cheap. Save lots.

    (setq delete-old-versions -1)
    (setq version-control t)
    (setq vc-make-backup-files t)
    (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

## Save desktop<a id="sec-2-13" name="sec-2-13"></a>

    (desktop-save-mode 1)

## Multiple Cursors<a id="sec-2-14" name="sec-2-14"></a>

    (use-package multiple-cursors
      :ensure t
      :init
      (progn
        ;; these need to be defined here - if they're lazily loaded with
        ;; :bind they don't work.
        (global-set-key (kbd "C->") 'mc/mark-next-like-this)
        (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
        (global-set-key (kbd "C-c C-l") 'mc/edit-ends-of-lines)))

## OSX Behavior<a id="sec-2-15" name="sec-2-15"></a>

Taken from the Spacemacs OSX module

    (when (equal system-type 'darwin)
      ;; Treat option as meta and command as super
      (setq mac-option-key-is-meta t)
      (setq mac-command-key-is-meta nil)
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta))

Use Super to get modern-style keybindings.

    (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
    (global-set-key (kbd "s-v") 'yank)
    (global-set-key (kbd "s-c") 'kill-ring-save)
    (global-set-key (kbd "s-x") 'kill-region)
    (global-set-key (kbd "s-w") 'kill-this-buffer)
    (global-set-key (kbd "s-z") 'undo-tree-undo)
    (global-set-key (kbd "s-s") 'save-buffer)
    (global-set-key (kbd "s-Z") 'undo-tree-redo)

## C/C++ Behavior<a id="sec-2-16" name="sec-2-16"></a>

Use a better indentation for C code.

    (setq c-default-style "linux"
          c-basic-offset 4)

## Avy (navigation)<a id="sec-2-17" name="sec-2-17"></a>

    (use-package avy
      :ensure t
      :bind (("C-;" . avy-goto-word-or-subword-1))
      :config
      (setq avy-background t))

# UI settings<a id="sec-3" name="sec-3"></a>

## Font<a id="sec-3-1" name="sec-3-1"></a>

    (if (member "DejaVu Sans Mono" (font-family-list))
        (set-face-attribute 'default nil :family "DejaVu Sans Mono" q:height 110))

## Turn off the scroll bar and the tool bar and the menu bar.<a id="sec-3-2" name="sec-3-2"></a>

    (scroll-bar-mode -1)
    (menu-bar-mode -1)
    (when (fboundp 'tool-bar-mode)
      (tool-bar-mode -1))

## Use a nice theme<a id="sec-3-3" name="sec-3-3"></a>

    (use-package gruvbox-theme
      :ensure t
      :init (progn (load-theme 'gruvbox-dark-medium t))
      )
    (use-package helm-themes
      :ensure t
      )

## Turn on blinking cursor<a id="sec-3-4" name="sec-3-4"></a>

    (blink-cursor-mode t)

## Highlight current line<a id="sec-3-5" name="sec-3-5"></a>

    (global-hl-line-mode)

## Diminish<a id="sec-3-6" name="sec-3-6"></a>

    (use-package diminish
      :ensure t)

## Rainbow delimiters<a id="sec-3-7" name="sec-3-7"></a>

    (use-package rainbow-delimiters
      :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
      :diminish rainbow-delimiters-mode
      :ensure t)

## Smart Mode Line<a id="sec-3-8" name="sec-3-8"></a>

    (use-package smart-mode-line
      :ensure    smart-mode-line
      :init      (progn (setq sml/theme 'respectful
                              sml/no-confirm-load-theme t
                              column-number-mode t))
      :config    (sml/setup))

# Org settings<a id="sec-4" name="sec-4"></a>

## Make sure that code is highlighted properly in org files<a id="sec-4-1" name="sec-4-1"></a>

    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)
    (setq org-agenda-files (quote ("~/nest/personal/org")))
    (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                     (org-agenda-files :maxlevel . 9))))

# Anzu replace<a id="sec-5" name="sec-5"></a>

    (use-package anzu
      :diminish anzu-mode
      :bind (("M-%" . anzu-query-replace)
             ("C-M-%" . anzu-query-replace-regexp))
      :init (global-anzu-mode 1)
      :ensure t)

# Undo tree<a id="sec-6" name="sec-6"></a>

    (use-package undo-tree
      :diminish undo-tree-mode
      :init (progn(setq undo-tree-visualizer-diff t
                        undo-tree-visualizer-timestamps t)
                  (global-undo-tree-mode))
      :ensure t)

# Switch window<a id="sec-7" name="sec-7"></a>

    (use-package switch-window
      :bind ("C-x o" . switch-window)
      :ensure t)
    
    (use-package windmove
      :config (windmove-default-keybindings 'shift))

# Version control<a id="sec-8" name="sec-8"></a>

## Magit<a id="sec-8-1" name="sec-8-1"></a>

    (use-package magit
      :bind ("C-x g" . magit-status)
      :ensure t
      )

## Git Gutter<a id="sec-8-2" name="sec-8-2"></a>

    (use-package git-gutter
      :commands (global-git-gutter-mode git-gutter-mode)
      :init
      (progn
        (global-git-gutter-mode t)
        (setq git-gutter:modified-sign "|"
              git-gutter:added-sign "+"
              git-gutter:deleted-sign "-"
              git-gutter:hide-gutter t))
      :ensure t
      :diminish git-gutter-mode)

# Projectile<a id="sec-9" name="sec-9"></a>

    (use-package projectile
      :config (progn
                (setq projectile-completion-system 'helm)
                (setq projectile-switch-project-action 'helm-projectile)
                (projectile-global-mode t)
                )
      :init      (progn
                   (setq projectile-indexing-method     'alien
                         projectile-enable-caching      t))
      :ensure t)

# Helm<a id="sec-10" name="sec-10"></a>

## Helm configurations<a id="sec-10-1" name="sec-10-1"></a>

      (use-package helm
        :bind (("M-x"     . helm-M-x)
               ("C-x C-f" . helm-find-files)
               ("C-x C-r" . helm-recentf)
               ("M-y" . helm-show-kill-ring)
               ("C-x b" . helm-mini)
               ("C-h f" . helm-apropos)
               ("C-h r" . helm-info-emacs)
               ("C-h C-l" . helm-locate-library)
               ("C-h SPC" . helm-all-mark-rings))
    
        :init (progn
                (use-package helm-config)
                (use-package helm-projectile
                  :init (helm-projectile-on)
                  :ensure t)
                (use-package helm-descbinds
                  :init (helm-descbinds-mode)
                  :ensure t)
                (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
                      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
                      helm-M-x-fuzzy-matching               t ; fuzzy matching for M-x
                      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
                      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
                      helm-ff-file-name-history-use-recentf t)
                (helm-mode +1)
                (define-key helm-command-map (kbd "o")     'helm-occur)
                (define-key helm-command-map (kbd "g")     'helm-do-grep)
                (define-key helm-command-map (kbd "C-c w") 'helm-wikipedia-suggest)
                (define-key helm-command-map (kbd "SPC")   'helm-all-mark-rings)
                (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
                (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
                (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
                )
        :ensure t
        :diminish helm-mode
    )

## Helm gtags<a id="sec-10-2" name="sec-10-2"></a>

    ;; this variables must be set before load helm-gtags
    ;; you can change to any prefix key of your choice
    (setq
     helm-gtags-ignore-case t
     helm-gtags-auto-update t
     helm-gtags-use-input-at-cursor t
     helm-gtags-pulse-at-cursor t
     helm-gtags-prefix-key "\C-cg"
     helm-gtags-suggested-key-mapping t
     )
    
    (use-package helm-gtags
      :ensure t
      :init
      (progn
          ;; Enable helm-gtags-mode in Dired so you can jump to any tag
        ;; when navigate project tree with Dired
        (add-hook 'dired-mode-hook 'helm-gtags-mode)
    
        ;; Enable helm-gtags-mode in Eshell for the same reason as above
        (add-hook 'eshell-mode-hook 'helm-gtags-mode)
    
        ;; Enable helm-gtags-mode in languages that GNU Global supports
        (add-hook 'c-mode-hook 'helm-gtags-mode)
        (add-hook 'c++-mode-hook 'helm-gtags-mode)
        (add-hook 'java-mode-hook 'helm-gtags-mode)
        (add-hook 'asm-mode-hook 'helm-gtags-mode)
    
        ;; key bindings
        (with-eval-after-load 'helm-gtags
          (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
          (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
          (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
          (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
          (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
          (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)))
      :diminish helm-gtags-mode)

## Helm swoop<a id="sec-10-3" name="sec-10-3"></a>

    (use-package helm-swoop
      :bind (("C-c C-SPC" . helm-swoop)
             ("C-c o" . helm-multi-swoop-all)
             ("C-s"   . helm-swoop)
             ("C-r"   . helm-resume))
      :ensure t)

# Company<a id="sec-11" name="sec-11"></a>

    (use-package company
      :config (progn(setq company-idle-delay 0.5)
                    (setq company-tooltip-limit 10)
                    (setq company-minimum-prefix-length 2)
                    (setq company-tooltip-flip-when-above t)
                    (add-hook 'after-init-hook 'global-company-mode))
      :diminish company-mode
      :ensure t)

# Guide key<a id="sec-12" name="sec-12"></a>

    (use-package guide-key
      :diminish guide-key-mode
      :init (guide-key-mode 1)
      :config (setq guide-key/guide-key-sequence
                    '("C-x"(projectile-mode "C-c p"))
                    guide-key/recursive-key-sequence-flag t)
      :ensure t)

# Package list<a id="sec-13" name="sec-13"></a>

    (use-package paradox
      :ensure t
    )

# Buffer moving<a id="sec-14" name="sec-14"></a>

    (use-package buffer-move
      :ensure t
      :bind (
             ("C-M-h" . buf-move-left)
             ("C-M-j" . buf-move-down)
             ("C-M-k" . buf-move-up)
             ("C-M-l" . buf-move-right)))

# Programming modes<a id="sec-15" name="sec-15"></a>

## Protocol Buffers<a id="sec-15-1" name="sec-15-1"></a>

    (use-package protobuf-mode
      :ensure t
      :mode "\\.proto\\'"
      :config
      (defconst my-protobuf-style
        '((c-basic-offset . 2)
          (indent-tabs-mode . nil)))
      (add-hook 'protobuf-mode-hook
                (lambda () (c-add-style "my-style" my-protobuf-style t)))
      )

## Makefiles<a id="sec-15-2" name="sec-15-2"></a>

    (add-to-list 'auto-mode-alist '("\\.mak\\'" . makefile-mode))
