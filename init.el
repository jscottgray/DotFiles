;; init.el -- Emacs configuration

;;; Commentary:
;; this is my Emacs configuration

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Save backup files to a different folder
(setq backup-directory-alist '(("." . "~/.saves")))

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;; This is so we don't have to have "ensure t" for each use-package
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; (require 'cl)
;; (require 'org-drill)

(use-package org-drill
  :defer t
  :ensure org-plus-contrib
  :commands (org-drill)
  :config
  ;; config optons
  )

;; Magit
(use-package magit)

;; MIPS MODE
;;----------
;; (add-to-list 'load-path "~/.emacs.d/mips-mode/")
;; (load "mips-mode.el")

;; Mips (CMPUT 229)
;; (require 'mips-mode)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
;; (global-hl-line-mode 1)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ;; Emacs Lisp Python Environment
;; (use-package elpy)
;; (elpy-enable)

;; (use-package py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; Superior Lisp Interaction Mode for Emacs
(use-package slime
  :init
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy slime-company))
  :config
  (require 'slime-autoloads))

;; Connect to slime whenever a Lisp file is opened
;; (add-hook 'slime-mode-hook
;; 	  (lambda ()
;; 	    (unless (slime-connected-p)
;; 	      (save-excursion (slime)))))

(fset 'lisp-test
      [?\C-x ?\C-s ?\C-c ?\C-l return ?\s-\' ?\M-p return])
(global-set-key "\C-t" 'lisp-test)

;; Clojure
(use-package clojure-mode
  :ensure t)

;; PDF-Tools
(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
(pdf-tools-install)

;; Web Mode
(use-package web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(use-package company-web)

(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

;; Move Text
(use-package move-text
  :bind
  ("s-<up>" . move-text-up)
  ("s-<down>" . move-text-down))

;; hl-todo
(use-package hl-todo
  :init
  (add-hook 'after-init-hook 'global-hl-todo-mode t))

;; Org Drill
;; (require 'org-drill)

;; Vim mode
;;(use-package evil
;;  :ensure t
;;  :config
;;  (evil-mode 1))

(use-package flycheck-pycheckers)
(with-eval-after-load 'flycheck
    (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

;; FlyCheck
(use-package flycheck)
  ;; :commands global-flycheck-mode)
;; ;; show tips as convenient pos-top popups
;; (use-package flycheck-pos-tip)

;; Theme - Monokai
(use-package monokai-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0d0f11" "#DF8C8C" "#A8CE93" "#DADA93" "#83AFE5" "#c9b4cf" "#7FC1CA" "#e6eef3"])
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes
   (quote
    ("93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001" default)))
 '(fci-rule-color "#556873")
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0f11" "#7FC1CA"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0f11" "#A8CE93"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0f11" "#899BA6"))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (web-mode company-box treemacs-magit treemacs helm-posframe slime-company auto-complete all-the-icons paredit cider sx anzu anaconda-mode minimap ansi jedi ## move-text git-gutter monokai-theme rainbow-delimiters 2048-game spaceline-all-the-icons mips-mode flycheck org-plus-contrib magit tabbar tabbar-ruler dashboard org spaceline neotree which-key doom-themes use-package helm evil)))
 '(pdf-tools-handle-upgrades nil)
 '(save-place-mode t)
 '(tabbar-separator (quote (0.5)))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#3c4c55")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A8CE93")
    (cons 40 "#b8d293")
    (cons 60 "#c9d693")
    (cons 80 "#DADA93")
    (cons 100 "#e2d291")
    (cons 120 "#eaca90")
    (cons 140 "#F2C38F")
    (cons 160 "#e4bea4")
    (cons 180 "#d6b9b9")
    (cons 200 "#c9b4cf")
    (cons 220 "#d0a6b8")
    (cons 240 "#d799a2")
    (cons 260 "#DF8C8C")
    (cons 280 "#c98f92")
    (cons 300 "#b39399")
    (cons 320 "#9e979f")
    (cons 340 "#556873")
    (cons 360 "#556873")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Helm
(use-package helm
  :init
  (setq helm-M-x-fuzzy-match t
  helm-mode-fuzzy-match t
  helm-buffers-fuzzy-matching t
  helm-recentf-fuzzy-match t
  helm-locate-fuzzy-match t
  helm-semantic-fuzzy-match t
  helm-imenu-fuzzy-match t
  helm-completion-in-region-fuzzy-match t
  helm-candidate-number-list 150
  helm-split-window-in-side-p t
  helm-move-to-line-cycle-in-source t
  helm-echo-input-in-header-line t
  helm-autoresize-max-height 0
  helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

(use-package helm-posframe)

;; auto-complete
;; https://github.com/auto-complete/auto-complete
(use-package auto-complete
  :init
  :config
  (ac-config-default))

;; anzu
;; when searching show how many matches in current buffer
;; https://github.com/syohex/emacs-anzu/
(use-package anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)



(define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
(define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)

;; Which Key
;; displays available keybindings in popup
;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; UI configurations
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
;; (setq scroll-step 1)

;; (setq echo-keystrokes 0.1)

;; (menu-bar-mode   -1) ;; turn this on to remove menu bar options

(global-linum-mode 1)
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))
;; (add-to-list 'default-frame-alist '(height . 30))
;; (add-to-list 'default-frame-alist '(width . 90))
(setq frame-title-format "%b")

(use-package sx
  :ensure t
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

;; All The Icons
(use-package all-the-icons)

;; NeoTree
;; Tree explorer plugin for navigating the filesystem
;; (use-package neotree
  ;; :ensure t
  ;; :init
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :custom
  (treemacs-collapse-dirs 3)
  (treemacs-deferred-git-apply-delay 0.5)
  (treemacs-display-in-side-window t)
  (treemacs-file-event-delay 5000)
  (treemacs-file-follow-delay 0.2)
  (treemacs-follow-after-init t)
  (treemacs-follow-recenter-distance 0.1)
  (treemacs-git-command-pipe "")
  (treemacs-goto-tag-strategy 'refetch-index)
  (treemacs-indentation 2)
  (treemacs-indentation-string " ")
  (treemacs-is-never-other-window nil)
  (treemacs-max-git-entries 5000)
  (treemacs-no-png-images nil)
  (treemacs-no-delete-other-windows t)
  (treemacs-project-follow-cleanup nil)
  (treemacs-persist-file (expand-file-name ".cache/treemacs-persist" user-emacs-directory))
  (treemacs-recenter-after-file-follow nil)
  (treemacs-recenter-after-tag-follow nil)
  (treemacs-show-cursor nil)
  (treemacs-show-hidden-files t)
  (treemacs-silent-filewatch nil)
  (treemacs-silent-refresh nil)
  (treemacs-sorting 'alphabetic-desc)
  (treemacs-space-between-root-nodes t)
  (treemacs-tag-follow-cleanup t)
  (treemacs-tag-follow-delay 1.5)
  (treemacs-width 35)
  :config
  ;; The default width and height of the icons is 22 pixels. If you are
  ;; using a Hi-DPI display, uncomment this to double the icon size.
  (treemacs-resize-icons 44)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  :bind
  (("M-0"       . treemacs-select-window)
   ("C-x t 1"   . treemacs-delete-other-windows)
   ("C-x t t"   . treemacs)
   ("C-x t B"   . treemacs-bookmark)
   ("C-x t C-t" . treemacs-find-file)
   ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map ("C-p" . treemacs-previous-line)))

(use-package treemacs-magit
  :defer t
  :after (treemacs magit))

;; Powerline
(use-package spaceline
  :ensure t
  :init
  :config
  (setq spaceline-buffer-encoding-abbrev-p nil)
  (setq spaceline-line-column-p nil)
  (setq spaceline-line-p nil)
  (setq powerline-default-separator (quote arrow))
  (setq powerline-default-separator nil) ;; options: slant, arrow, wave, none
  (spaceline-emacs-theme))
;;  (spaceline-toggle-minor-modes-off)
;;  (spaceline-toggle-buffer-size-off)
;;  (spaceline-toggle-evil-state-on))

;; ((The following lines are always needed. Choose your own keys.)
;; neotree
(global-set-key (kbd "<f9>") 'neotree-toggle)
;; org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(global-set-key (kbd "C-c a") 'org-agenda)
;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; compile
(global-set-key (kbd "C-x <f12>") 'compile)



;; Make M-x compile smarter in order to guess language
(require 'compile)
(defvar compile-guess-command-table
  '((c-mode       . "gcc -Wall -Wextra -g %s -o %s -lm")
    (c++-mode     . "g++ -Wall -Wextra %s -o %s -std=c++14")
    (fortran-mode . "gfortran -C %s -o %s")
    ))

(defun compile-guess-command ()
  (let ((command-for-mode (cdr (assq major-mode
                                     compile-guess-command-table))))
    (if (and command-for-mode
             (stringp buffer-file-name))
        (let* ((file-name (file-name-nondirectory buffer-file-name))
               (file-name-sans-suffix (if (and (string-match "\\.[^.]*\\'"
                                                             file-name)
                                               (> (match-beginning 0) 0))
                                          (substring file-name
                                                     0 (match-beginning 0))
                                        nil)))
          (if file-name-sans-suffix
              (progn
                (make-local-variable 'compile-command)
                (setq compile-command
                      (if (stringp command-for-mode)
                          ;; Optimize the common case.
                          (format command-for-mode
                                  file-name file-name-sans-suffix)
                        (funcall command-for-mode
                                 file-name file-name-sans-suffix)))
                compile-command)
            nil))
      nil)))


;; Add the appropriate mode hooks.
(add-hook 'c-mode-hook       (function compile-guess-command))
(add-hook 'c++-mode-hook     (function compile-guess-command))
(add-hook 'fortran-mode-hook (function compile-guess-command))

;; Custom Homescreen
(use-package dashboard
 :config
 (dashboard-setup-startup-hook))

;; don't show startup screen
(setq inhibit-startup-screen t)

;; set tramp to use ssh as default
(setq tramp-default-method "ssh")

;; rainbow delimiters
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #' rainbow-delimiters-mode)

;; flycheck
(use-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

;; autocomplete paired brackets
(electric-pair-mode 1)

;; set path to Python 3 so it doesn't use Python 2
(setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/3.7/bin/python3")

;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(use-package paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


(global-set-key (kbd "s-/")'comment-line)

;; init.el ends here

