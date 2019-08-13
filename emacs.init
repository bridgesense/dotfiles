; ~/.emacs --- Emacs Inititialization File
;;; Commentary:
;; This script contains a collection of shortcuts influenced by YADR.  Auto-popup
;; documentation is provided to introduce new users to the key shortcuts.
;; Custom shortcuts can be accessed through typing the YADR leader "," in Evil mode
;; or "Ctrl-," in traditional Emacs modes.
;; # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
;;; Code:


;; Removes Top Toolbar and Scrollbar
;; # # # # # # # # # # #
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
(menu-bar-mode -1)


;; Handiles Backup Files
;; # # # # # # # # # # #
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist '((".*" . "~/.emacs.d/.emacs-saves"))    ; don't litter my fs tree
 auto-save-file-name-transforms '((".*" "~/.emacs.d/.emacs-saves" t))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; Default Font and Transparency
;; # # # # # # # # # # #
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "Dejavu Sans Mono" "Monaco"))))
 '(diff-added ((t (:foreground "#cc241d" :background "#282828"))))
 '(diff-changed ((t (:foreground "#d79921" :background "#282828"))))
 '(diff-context ((t (:inherit default foreground "#ebdbb2" :background "#282828"))))
 '(diff-file-header ((t (:foreground "#ebdbb2" :background "#282828"))))
 '(diff-function ((t (:inherit diff-header: foreground "#ebdbb2" :background "#282828" :inverse-video t))))
 '(diff-header ((t (:foreground "#ebdbb2" :background "#282828"))))
 '(diff-hunk-header ((t (:inherit diff-header :foreground "#ebdbb2" :background "#282828" :inverse-video t))))
 '(diff-index ((t (:foreground "#ebdbb2" :background "#282828"))))
 '(diff-nonexistent ((t (:foreground "#ebdbb2" :background "#282828"))))
 '(diff-refine-added ((t (:foreground "#cc241d" :background "#282828"))))
 '(diff-refine-changed ((t (:foreground "#d79921" :background "#282828"))))
 '(diff-refine-removed ((t (:foreground "#cc241d" :background "#282828"))))
 '(diff-removed ((t (:foreground "#cc241d" :background "#cc241d" :inherit font-lock-comment-face :slant italic))))
 '(ediff-current-diff-A ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-current-diff-Ancestor ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-current-diff-B ((t (:foreground "#d79921" :background "#282828"))))
 '(ediff-current-diff-C ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-even-diff-A ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-even-diff-Ancestor ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-even-diff-B ((t (:foreground "#d79921" :background "#282828"))))
 '(ediff-even-diff-C ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-fine-diff-A ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-fine-diff-Ancestor ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-fine-diff-B ((t (:foreground "#d79921" :background "#282828"))))
 '(ediff-fine-diff-C ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-odd-diff-A ((t (:foreground "#cc241d" :background "#282828"))))
 '(ediff-odd-diff-B ((t (:foreground "#d79921" :background "#282828"))))
 '(ediff-odd-diff-C ((t (:foreground "#cc241d" :background "#282828"))))
 '(org-level-1 ((t (:inherit default :weight bold :height 1.25))))
 '(org-level-2 ((t (:inherit default :weight bold :height 1.15))))
 '(org-level-3 ((t (:inherit default :weight bold :height 1.1))))
 '(org-level-4 ((t (:inherit default :weight bold))))
 '(org-level-5 ((t (:inherit default :weight bold))))
 '(org-level-6 ((t (:inherit default :weight bold))))
 '(org-level-7 ((t (:inherit default :weight bold))))
 '(org-level-8 ((t (:inherit default :weight bold)))))
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))


;; Additional Repos
;; # # # # # # # # # # #
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Misc
;; # # # # # # # # # # #
;; Tabs to spaces
(setq-default indent-tabs-mode nil)
;; Tab width
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; Turn off line wrapping by default
(set-default 'truncate-lines t)
;; Make eww default browser
(setq browse-url-browser-function 'eww-browse-url)
;; Turn off alarms
(setq ring-bell-function 'ignore)
;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; GPUPG Fix 
(setf epa-pinentry-mode 'loopback)


;; File Managementa
;; # # # # # # # # # # #
(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


;; Package Management
;; # # # # # # # # # # #
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))


;; For Diminishing TMI stuff on the mode line
;; # # # # # # # # # # #
(use-package diminish :ensure t)


;; CSV Mode
;; (use-package csv-mode :ensure t)


;; # # # # # # # # # # #
;; Fixes cut/paste in Ansi-Terminal and other places
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)


;; Evil Vim & Plugins
;; # # # # # # # # # # #
(use-package evil :ensure t :diminish evil-mode
  :config
  (evil-mode 1))
(use-package evil-surround :ensure t
  :diminish evil-surround-mode
  :config
  (global-evil-surround-mode 1))
(use-package evil-tutor :ensure t)
(use-package evil-commentary :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode 1))
(define-key evil-normal-state-map (kbd "C-v") 'clipboard-yank)
;; browse in emacs mode
(add-hook 'eww-mode-hook
            (lambda ()
              (evil-set-initial-state 'eww-mode 'emacs)))
;; Helps prevent excess cpu during visual mode
(setq auto-window-vscroll nil)

;; More Vim-like
;; # # # # # # # # # # #
(evil-define-motion evil-last-non-blank (count)
  "Move the cursor to the last non-blank character
                    on the current line. If COUNT is given, move COUNT - 1
                    lines downward first."
  :type inclusive
  (evil-end-of-line count)
  (re-search-backward "^\\|[^[:space:]]")
  (setq evil-this-type (if (eolp) 'exclusive 'inclusive)))
(define-key evil-motion-state-map "g$" 'evil-end-of-line)
(define-key evil-motion-state-map "$" 'evil-last-non-blank)


;; Helm
;; # # # # # # # # # # #
(use-package helm :ensure t
  :diminish helm-mode
  :config
  (require 'helm-config)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (add-hook 'helm-mode-hook
            (lambda ()
              ;; escape quits in Terminal work around
              (bind-key "<escape>" 'isearch-cancel isearch-mode-map)
              (bind-key "<escape>" 'helm-keyboard-quit helm-map)
              (bind-key "<escape>" 'helm-keyboard-quit helm-comp-read-map)
              ;; adds paste functionality to helm
              (define-key isearch-mode-map (kbd "C-v") 'clipboard-yank)
              (define-key helm-map (kbd "C-v") 'clipboard-yank)
              (define-key helm-comp-read-map (kbd "C-v") 'clipboard-yank)))
  (helm-mode 1))


;; Autopair Mode
;; # # # # # # # # # # #
(use-package autopair :ensure t
  :diminish autopair-mode
  :config
  (autopair-global-mode 1))


;; Org Mode
;; # # # # # # # # # # #
;; Set Clock Format
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
;; Symmetric Inline Encryption
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)
(setq auto-save-default nil)
;; Symmetric File Encryption
(require 'epa-file)
(epa-file-enable)
;;(setq epa-file-select-keys nil)
;; Theme Conventions for Org Mode
;; Hide emphasis marks
(setq org-hide-emphasis-markers t)
;; Add bullets for lists and convential clipboard access
(use-package org-bullets :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode 1)
              (local-set-key (kbd "C-v") 'clipboard-yank)
              )))
;; Org Mode Timing Drawer
(setq org-clock-into-drawer t)
;; Org Mode Evil compatiblity workaround for terminal
(add-hook 'org-mode-hook
          (lambda ()
            (define-key evil-normal-state-map (kbd "C-h") 'org-metaleft)
            (define-key evil-normal-state-map (kbd "C-k") 'org-metaup)
            (define-key evil-normal-state-map (kbd "C-j") 'org-metadown)
            (define-key evil-normal-state-map (kbd "C-l") 'org-metaright)
            (define-key evil-normal-state-map "H" 'org-shiftleft)
            (define-key evil-normal-state-map "K" 'org-shiftup)
            (define-key evil-normal-state-map "J" 'org-shiftdown)
            (define-key evil-normal-state-map "L" 'org-shiftright)
            (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)))
;; Plantuml
;; http://eschulte.github.io/babel-dev/DONE-integrate-plantuml-support.html
(use-package plantuml-mode :ensure t)
(use-package flycheck-plantuml :ensure t)
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-plantuml-jar-path
            (expand-file-name "~/.yadrlite/src/org/contrib/scripts/plantuml.jar"))
;; Artist Mode
(evil-set-initial-state 'artist-mode 'emacs)
(defun toggle-artist-mode ()
  "Toggles artist mode"
  (interactive)
  (if (bound-and-true-p artist-mode)
      (artist-mode-off)
    (artist-mode)))


;; Fix the terminal
;; # # # # # # # # # # #
(setq multi-term-program "/usr/bin/bash")
(use-package multi-term :ensure t
  :config
  (add-hook 'term-mode-hook
            (lambda ()
              (evil-set-initial-state 'term-mode 'emacs)
              (setq term-buffer-maximum-size 25000)
              (setq show-trailing-whitespace nil)
              (prefer-coding-system 'utf-8)
              (autopair-mode -1)
              (define-key term-raw-map (kbd "C-v") 'term-paste)
              (define-key term-raw-map (kbd "<prior>") 'scroll-down)
              (define-key term-raw-map (kbd "<next>") 'scroll-up)
              (define-key term-raw-map (kbd "<escape>") 'term-send-esc)
              (define-key term-raw-map (kbd "<delete>") 'term-send-backspace)
              (define-key term-raw-map (kbd "<backspace>") 'term-send-backspace))))
;; toggles line mode when flipping states
(add-hook 'evil-normal-state-entry-hook
     (lambda ()
       (if (eq major-mode 'term-mode)
         (term-line-mode))))
(add-hook 'evil-emacs-state-entry-hook
      (lambda ()
        (when (eq major-mode 'term-mode)
          (if (term-in-line-mode)
             (condition-case nil
                   (term-char-mode)
                (error nil))))))
(defun term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))
(use-package exec-path-from-shell :ensure t
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))


;; smooth scrolling
;; # # # # # # # # # # #
(use-package smooth-scrolling :ensure t
  :diminish smooth-scrolling-mod
  :config
  (smooth-scrolling-mode 1))


;; aggressive indentation
;; # # # # # # # # # # #
(use-package aggressive-indent :ensure t
  :diminish aggressive-indent-mode)


;; Syntax
;; # # # # # # # # # # #
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))
(use-package web-mode :ensure t
  :diminish web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.htm[l]?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (local-set-key '[backtab] 'indent-relative)
              (rainbow-mode 1)
              (setq indent-tabs-mode nil)
              (setq web-mode-enable-auto-pairing t)
              (setq web-mode-enable-comment-interpolation t)
              (setq web-mode-enable-heredoc-fontification t)
              (setq web-mode-enable-current-element-highlight t)
              (setq web-mode-enable-current-column-highlight t)
              (setq web-mode-markup-indent-offset 2
                    web-mode-css-indent-offset 2
                    web-mode-code-indent-offset 2))))
  (add-hook 'css-mode-hook
              (lambda ()
                (rainbow-mode 1)))
  (add-hook 'scss-mode-hook
              (lambda ()
                (rainbow-mode 1)))
(use-package xah-css-mode :ensure t
  :diminish css-mode)
(use-package php-mode :ensure t
  :diminish php-mode)
;;(defun php-syntax-propertize-function (start end)
;;  "This may break PHP syntax highlighting for increased performance.")
(use-package coffee-mode :ensure t
  :diminish coffee-mode)
(use-package sass-mode :ensure t
  :diminish sass-mode)
(use-package csv-mode :ensure t
  :diminish csv-mode)
(use-package json-mode :ensure t
  :diminish json-mode)
(use-package flycheck :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode)
  (flycheck-add-mode 'html-tidy 'web-mode)
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.15))))
(defun flycheck-list-errors-toggle ()
  "Toggle the error list for the current buffer."
  (interactive)
  (let ((flycheck-errors-window (get-buffer-window flycheck-error-list-buffer)))
    (if (not (window-live-p flycheck-errors-window))
        (call-interactively 'flycheck-list-errors)
      (delete-window flycheck-errors-window))))
;; Show Matching Pairs
(show-paren-mode 1)
;; Show HTML Colors
(use-package rainbow-mode :ensure t :diminish rainbow-mode)
;; YASnippet
(use-package yasnippet :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))
;; PHP Scratch
(use-package php-scratch :ensure t)
;; Toggle PHP/Web Mode
(defun toggle-php-flavor-mode ()
  "Toggle mode between PHP & Web-Mode Helper modes."
  (interactive)
  (cond ((string= mode-name "PHP/l")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))
;; Web Beautify
(use-package web-beautify :ensure t)
(defun beautify-code ()
  "Beautify CSS, HTML or JS"
  (interactive)
  (cond
    ((eq major-mode 'js-mode) (web-beautify-js))
    ((eq major-mode 'json-mode) (web-beautify-js))
    ((eq major-mode 'sgml-mode) (web-beautify-html))
    ((eq major-mode 'web-mode) (web-beautify-html))
    ((eq major-mode 'xah-css-mode) (web-beautify-css))
    ((eq major-mode 'css-mode) (web-beautify-css))
    ((eq major-mode 'scss-mode) (web-beautify-css))
    ((indent-region (point-min) (point-max)))))

;; Fix page numbers in table of contents for Orgmode exports
(setq
  org-latex-pdf-process
  '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Use LuaLatex instead of default
(setq org-latex-pdf-process
    '("lualatex -shell-escape -interaction nonstopmode %f"
    "lualatex -shell-escape -interaction nonstopmode %f"))


;; Help Mode
;; # # # # # # # # # # #
(use-package which-key :ensure t
  :diminish which-key-mode
  :config
  (set-face-attribute 'which-key-key-face nil :foreground "#83a598")
  (which-key-mode 1))


;; Git Gutter Fringe
;; # # # # # # # # # # #
(use-package fringe-helper :ensure t)
(use-package git-gutter :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode +1))
(if window-system (use-package git-gutter-fringe :ensure t))


;; Gruvbox Theme
;; # # # # # # # # # # #
(use-package gruvbox-theme :ensure t
  :config
  (setq active-theme 'gruvbox-dark-soft)
  (load-theme active-theme t))
(defun toggle-light-dark-theme ()
  "Toggle Light and Dark themes"
  (interactive)
  (if (eq active-theme 'gruvbox-light-soft)
      (setq active-theme 'gruvbox-dark-soft)
    (setq active-theme 'gruvbox-light-soft))
  (load-theme active-theme t)
  (gruvbox-modeline-reset)
  (powerline-reset))
(defun gruvbox-modeline-reset ()
  "Dark Mode Line"
  (if (eq active-theme 'gruvbox-light-soft)
      (progn
        (set-face-attribute 'mode-line nil
                            :foreground "#282828"
                            :background "#bdae93")
        (set-face-attribute 'mode-line-inactive nil
                            :foreground "#928374"
                            :background "#fbf1c7")
        (set-face-attribute 'powerline-active1 nil
                            :foreground "#ebdbb2"
                            :background "#928374")
        (set-face-attribute 'powerline-active2 nil
                            :foreground "#3c3836"
                            :background "#d5c4a1")
        (set-face-attribute 'powerline-inactive1 nil
                            :foreground "#928374"
                            :background "#ebdbb2")
        (set-face-attribute 'powerline-inactive2 nil
                            :foreground "#928374"
                            :background "#fbf1c7:"))
    (progn
      (set-face-attribute 'mode-line nil
                          :foreground "#ebdbb2"
                          :background "#504945")
      (set-face-attribute 'mode-line-inactive nil
                          :foreground "#bdae93"
                          :background "#282828")
      (set-face-attribute 'powerline-active1 nil
                          :foreground "#ebdbb2"
                          :background "#928374")
      (set-face-attribute 'powerline-active2 nil
                          :foreground "#bdae93"
                          :background "#3c3836")
      (set-face-attribute 'powerline-inactive1 nil
                          :foreground "#bdae93"
                          :background "#282828")
      (set-face-attribute 'powerline-inactive2 nil
                          :foreground "#bdae93"
                          :background "#1d2021"))))


;; Misc Helm Packages and Dependencies
;; # # # # # # # # # # #
(use-package helm-swoop :ensure t)


;; Spruce Up line numbers
;; # # # # # # # # # # #
;; Line numbering on by default
;; (global-linum-mode 1)
;; Highlight current line number
;; (use-package hlinum :ensure t
;;  :config
;;  (hlinum-activate))


;; Add relative line numbering option
(use-package linum-relative :ensure t
  :diminish linum-relative-mode)


;; Ace Jump Mode (a very nice Easy Motion alternative)
;; # # # # # # # # # # #
(use-package ace-jump-mode :ensure t :diminish ace-jump-mode)

;; Spell Check
;; # # # # # # # # # # #
(use-package helm-flyspell :ensure t)


;; Dictionary
;; # # # # # # # # # # #
(use-package define-word :ensure t)


;; Thesaurus
(use-package synosaurus :ensure t
  :config
  (synosaurus-mode 1))


;; Battery Update
(use-package fancy-battery :ensure t
  :config
  (fancy-battery-mode 1))


;; Smart Mode Line
;; # # # # # # # # # # #
(if (not (window-system))
    (use-package evil-terminal-cursor-changer :ensure t
      :config
      (evil-terminal-cursor-changer-activate)))

(use-package spaceline :ensure t
  :config
  (setq evil-normal-state-cursor '(box "#bdae93")
        evil-insert-state-cursor '((bar . 3) "#83a598")
        evil-visual-state-cursor '(box "#fabd2f")
        evil-motion-state-cursor '(box "#d3869b")
        evil-replace-state-cursor '(box "#cc241d")
        evil-operator-state-cursor '(box "#b8bb26")
        evil-emacs-state-cursor '(box "#098B9F"))
  (setq powerline-default-separator 'wave)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq evil-emacs-state-tag "EMACS")
  (setq evil-insert-state-tag "INSERT")
  (setq evil-motion-state-tag "MOTION")
  (setq evil-normal-state-tag "NORMAL")
  (setq evil-replace-state-tag "REPLACE")
  (setq evil-visual-state-tag "VISUAL")
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-hud-off)
  (set-face-attribute 'spaceline-evil-emacs nil :background "#098B9F")
  (set-face-attribute 'spaceline-evil-insert nil :background "#83a598")
  (set-face-attribute 'spaceline-evil-motion nil :background "#d3869b")
  (set-face-attribute 'spaceline-evil-normal nil :background "#bdae93")
  (set-face-attribute 'spaceline-evil-replace nil :background "#cc241d")
  (set-face-attribute 'spaceline-evil-visual nil :background "#fabd2f")
  (gruvbox-modeline-reset)
  (powerline-reset))


;; Projectile (better than ctrlp)
;; # # # # # # # # # # #
;; uncomment next line for MacOS
;; (setq projectile-indexing-method 'git)
(use-package projectile :ensure t
  :diminish projectile-mode
  :config
  (projectile-global-mode))
(use-package helm-projectile :ensure t)
(use-package helm-ag :ensure t
  :config
  (custom-set-variables
    ;;bug in ag not on first search
    ;;'(helm-ag-base-command "ag --nocolor --nogroup")))
    '(helm-ag-base-command "ack --nocolor --nogroup")))

;; Dashboard
;; # # # # # # # # # # #
(use-package page-break-lines :ensure t
  :diminish page-break-lines-mode)
(setq dashboard-banner-logo-title "Welcome to YADRLite")
(setq dashboard-items '((recents  . 15)
                        (bookmarks . 5)
                        (projects . 5)))
(use-package dashboard :ensure t
  :config
  (dashboard-setup-startup-hook))


;; Geben for Xdebug
;; # # # # # # # # # # #
;; reset geben strategy at startup
(shell-command "rm -f ~/.emacs.d/geben/.storage")
(use-package geben :ensure t
  :diminish geben-mode
  :config
  (setq geben-dbgp-default-port 9041))


;; Rangerlike File Browser
;; # # # # # # # # # # #
(use-package cl-lib :ensure t)
(use-package ranger :ensure t
  :diminish ranger-mod
  ;;  :init
  ;;  (require 'cl-lib)
  :config
  ;; Add ability to create directory
  (define-key ranger-normal-mode-map (kbd "+") #'dired-create-directory)
  ;; Set as default browser
  (ranger-override-dired-mode t)
  ;; Remove ranger buffer when done
  (setq ranger-cleanup-on-disable t)
  ;; Kill browser buffers when drilling down
  (setq ranger-cleanup-eagerly t))


;; Refresh Buffer
;; # # # # # # # # # # #
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))


;; Magit a Git handler
;; # # # # # # # # # # #
(use-package magit :ensure t
  :diminish magit-mode)
;; helm-ls-git
(use-package helm-ls-git :ensure t)
(use-package evil-magit :ensure t)


;; Auto Completion with Company
(use-package bbdb :ensure t
             :config
             (setq bbdb-file "~/.bbdb")
             (setq bbdb-complete-name-full-completion t)
             (setq bbdb-completion-type 'primary-or-name)
             (setq bbdb-complete-name-allow-cycling t)
             (setq bbdb-message-all-addresses t)
             (setq bbdb-pop-up-window-size 0.25)
             (setq bbdb-mua-pop-up-window-size 0.25)
             (setq bbdb-mua-update-interactive-p '(query . create))
             (bbdb-initialize 'gnus 'message 'sendmail)
             (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
             (add-hook 'mail-setup-hook 'bbdb-insinuate-sendmail)
             (bbdb-mua-auto-update-init 'message)
             (setq bbdb-mua-auto-update-p 'query))
;; auto-complete emacs address using bbdb UI
(add-hook 'message-mode-hook
    '(lambda ()
        (flyspell-mode t)
        (local-set-key (kbd "TAB") 'bbdb-complete-name)))
;; turn off auto carraige return after 70 chars
(add-hook 'message-mode-hook 'turn-off-auto-fill)
(use-package bbdb-vcard :ensure t)
(use-package company-php :ensure t)
(use-package ac-php :ensure t
            :config
            (ac-php-core-eldoc-setup))
(use-package company-web :ensure t)
(use-package company-quickhelp :ensure t)
(use-package cl-lib :ensure t)
(use-package hippie-exp-ext :ensure t)
(use-package company :ensure t
             :diminish company-mode
             :config
             (add-hook 'after-init-hook 'global-company-mode)
             (add-to-list 'company-backends 'company-web)
             (add-to-list 'company-backends 'company-quickhelp)
             (add-to-list 'company-backends 'company-php)
             (add-to-list 'company-backends 'company-ac-php-backend)
             (add-to-list 'company-backends 'php-extras-company)
             (add-to-list 'company-backends 'company-Yasnippet)
             (add-to-list 'company-backends 'company-dabbrev)
             (add-to-list 'company-backends 'company-capf)
             (add-to-list 'company-backends 'company-files)
             (setq company-tooltip-limit 20)
             (setq company-tooltip-align-annotations 't)
             (setq company-idle-delay .3)
             (setq company-minimum-prefix-length 1)
             (setq company-begin-commands '(self-insert-command)))


;; leader key operation
;; # # # # # # # # # # #
(setq gleader ",")
(setq gleader-non "C-,")
(use-package general :ensure t
  :config
  (general-evil-setup)
  (general-override-mode)

  ;; Single Key Functions (YADR Remnants)
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "," '(helm-M-x :which-key "Search for Command")
   ";" '(evil-commentary :which-key "Un/Comment")
   "[" '(shrink-window-horizontally :which-key "Contract Window")
   "]" '(enlarge-window-horizontally :which-key "Expand Window")
   "-" '(shrink-window :which-key "Shrink Window")
   "=" '(enlarge-window :which-key "Grow Window")
   "a" '(helm-do-ag-project-root :which-key "Search Project")
   "d" '(ranger :which-key "File Ranger")
   "e" '(flycheck-list-errors-toggle :which-key "Toggle Error List")
   "j" '(ace-jump-char-mode :which-key "Jump to Character")
   "n" '(deer :which-key "Browse Current Directory")
   "q" '(kill-this-buffer :which-key "Kill Buffer")
   "Q" '(kill-emacs :which-key "Quit Emacs")
   "r" '(bbdb :which-key "Search Rolodex")
   "x" '(next-buffer :which-key "Next Buffer")
   "z" '(previous-buffer :which-key "Previous Buffer"))

  ;; Buffer Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "b"  '(nil :which-key "Buffer Operations")
   "bb" '(helm-buffers-list :which-key "List/Create Buffers")
   "bs" '(save-buffer :which-key "Save Buffer")
   "br" '(revert-buffer-no-confirm :which-key "Refresh Buffer"))

  ;; Window Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "w"  '(nil :which-key "Window Operations")
   "wd" '(delete-window :which-key "Kill Window")
   "wc" '(delete-other-windows :which-key "Clear All but Currenet")
   "wf" '(toggle-frame-fullscreen :which-key "Toggle Full Screen")
   "wh" '(evil-window-left :which-key "Select Window Left")
   "wj" '(evil-window-down :which-key "Select Window Above")
   "wk" '(evil-window-up :which-key "Select Window Below")
   "wl" '(evil-window-right :which-key "Select Window Right")
   "wH" '(evil-window-move-far-left :which-key "Move Window Left")
   "wJ" '(evil-window-move-very-bottom :which-key "Move Window Up")
   "wK" '(evil-window-move-very-top :which-key "Move Window Down")
   "wL" '(evil-window-move-far-right :which-key "Move Window Right")
   "wn" '(other-frame :which-key "Switch Screens")
   "wo" '(other-window :which-key "Select Next Window")
   "wp" '(make-frame :which-key "Pop Out to Screen")
   "ws" '(split-window-below :which-key "Horizontal Split")
   "wv" '(split-window-right :which-key "Vertical Split")
   "wx" '(delete-frame :which-key "Close Screen"))


  ;; Applicaitons
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "a"  '(nil :which-key "Application Shortcuts")
   "ai" '(erc :which-key "IRC")
   "at" '(multi-term :which-key "Terminal")
   "am" '(gnus :which-key "News/Mail")
   "ap" '(php-scratch :which-key "PHP Scratch Pad")
   "aw" '(browse-web :which-key "Browse Web"))


  ;; File Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "f"  '(nil :which-key "File Operations")
   "fc" '(my-put-file-name-on-clipboard :which-key "Copy File Path")'
   "ff" '(helm-find-files :which-key "Open File")
   "fd" '(deer :which-key "File Browser")
   "fr" '(revert-buffer :which-key "Revert to Prior State")
   "fp" '(helm-projectile-find-file :which-key "Find File"))


  ;; Geben Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "g"  '(nil :which-key "Geben (DBGp)")
   "gb" '(geben-add-current-line-to-predefined-breakpoints :which-key "Add Breakpoint")
   "gc" '(geben-clear-predefined-breakpoints :which-key "Clear Breakpoints")
   "gm" '((lambda () (interactive) (customize-variable 'geben-path-mappings)) :which-key "Set Path Mapping")
   "go" '(geben :which-key "Start Geben")
   "gr" '(geben-run :which-key "Continue to Breakpoint")
   "gv" '(geben-display-context :which-key "View Context")
   "gx" '(geben-end :which-key "Stop Geben"))


  ;; Line Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "l"  '(nil :which-key "Line Manipulation")
   "la" '(toggle-artist-mode :which-key "Draw With Cursor [Emacs Mode]")
   "lb" '(beautify-code :which-key "Beautify Code")
   "lc" '(rainbow-mode :which-key "Toggle Color Codes")
   "le" '(epa-encrypt-region :which-key "Encrypt Selection")
   "ld" '(epa-decrypt-region :which-key "Decrypt Selection")
   "li" '(agressive-indent-mode :which-key "Toggle Aggressive Indenting")
   "ln" '(display-line-numbers-mode :which-key "View Line Numbers")
   "lm" '(term-toggle-mode :which-key "(Terminal Only) Toggle Line/Character Mode")
   "lr" '(linum-relative-toggle :which-key "Toggle Relative Numbers")
   "ls" '(delete-trailing-whitespace :which-key "Delete Trailing Whitespaces")
   "lt" '(toggle-php-flavor-mode :which-key "Toggle PHP/Web Mode Highlighting")
   "lw" '(toggle-truncate-lines :which-key "Toggle Line Wrapping"))


  ;; Options
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "O"  '(nil :which-key "Options")
   "Ot" '(toggle-light-dark-theme :which-key "Toggle Dark/Light Theme"))


  ;; Org Mode Controls
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "o"  '(nil :which-key "Org-Mode Scheduler")
   "oo" '(org-agenda :which-key "Agenda View")
   "oa" '(org-ctrl-c-ctrl-c :which-key "Activate (C-c)")
   "od" '(org-deadline :which-key "Schedule Deadline")
   "oc" '(org-evaluate-time-range :which-key "Recompute Clock")
   "ok" '(org-schedule :which-key "Schedule Task")
   "og" '(org-set-tags-command :which-key "Set Tag")
   "ol" '(org-clock-display :which-key "Display Clocks")
   "oj" '(org-clock-goto :which-key "Jump to Running Task")
   "ot" '(org-clock-in :which-key "Start Task")
   "or" '(org-clock-report :which-key "Show Report")
   "os" '(org-clock-out :which-key "Stop Task")
   "ox" '(org-clock-cancel :which-key "Cancel Clock"))


  ;; Project Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "p"  '(nil :which-key "Project Commands")
   "pd" '(helm-do-ag :which-key "Search in Directory")
   "ph" '(magit-log-buffer-file :which-key "History of Buffer")
   "pf" '(helm-projectile-find-file :which-key "Fuzzy File (CtrlP)")
   "pP" '(helm-projectile :which-key "Open Recent Project")
   "pp" '(helm-resume :which-key "Helm Resume")
   "ps" '(helm-do-ag-project-root :which-key "Search in Project")
   "pm" '(magit-status :which-key "Git Status")
   "pw" '(helm-swoop :which-key "Helm Swoop"))


  ;; Word Functions
  (general-define-key
   :prefix gleader
   :non-normal-prefix gleader-non
   :states '(normal visual motion insert emacs)
   :keymaps 'override
   "W"  '(nil :which-key "Word Functions")
   "Ws" '(flyspell-mode :which-key "View Spelling Errors")
   "Wc" '(helm-flyspell-correct :which-key "Correct Spelling")
   "Wd" '(define-word-at-point :which-key "See Definition")
   "Wt" '(synosaurus-lookup :which-key "See Thesaurus"))
)

;; Warning!  Any lines modified below this point may be overwritten.