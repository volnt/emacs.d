;; Remove menu & scroll bars and other visual things
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq column-number-mode nil)
(setq line-number-mode nil)
(setq size-indication-mode nil)
(setq inhibit-startup-screen t)

;; Set custom file location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load use-package
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(add-to-list 'load-path "~/.emacs.d/site-lisp/diminish.el")

(require 'use-package)
(require 'diminish)

;; Install and setup packages
(use-package magit
  :ensure t
  :bind (("C-c s" . magit-status)
	 ("C-c b" . magit-blame)
	 ("C-c g" . vc-git-grep)))

(use-package undo-tree
  :ensure t
  :diminish
  :config (global-undo-tree-mode))

(use-package multiple-cursors
  :ensure t
  :bind ("C-c m" . mc/mark-all-in-region))

(use-package rainbow-delimiters
  :ensure t
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package py-isort
  :ensure t
  :bind ("C-c i" . py-isort-before-save)
  :custom
  (py-isort-options '("-w 120")))

(use-package projectile
  :ensure t
  :bind ("C-c f" . projectile-find-file)
  :config (projectile-mode))

(use-package autorevert
  :diminish)

(use-package jedi
  :ensure t
  :bind (("C-c ;" . jedi:goto-definition)
         ("C-c ," . jedi:goto-definition-pop-marker))
  :hook (python-mode . jedi:setup))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark))

(use-package hl-line
  :ensure t
  :config (global-hl-line-mode))

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode t))

;; (setq fringes-outside-margins t)

(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda-list)
	 ("C-c l" . org-store-link)
         ("C-c c" . org-capture))
  :config
  (setq org-html-doctype "html5")
  (setq org-capture-templates
        '(("b" "Backmarket todo entry." entry (file "~/dev/bm/todo.org")
           "* TODO %?\n  %i")
          ("p" "Personal todo entry." entry (file "~/todo.org")
           "* TODO %?\n  %i"))))

(use-package ido
  :ensure t
  :config (ido-mode t))

(use-package blacken
  :ensure t
  :diminish
  :hook (python-mode . blacken-mode)
  :custom (blacken-line-length 120))

(use-package realgud
  :ensure t
  :config (load-library "realgud"))

(use-package lua-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package terraform-mode
  :ensure t)

(use-package haxe-mode
  :mode ("\\.hx\\'" . haxe-mode)
  :no-require t
  :init
  (require 'js)
  (define-derived-mode haxe-mode js-mode "Haxe"
    "Haxe syntax highlighting mode. This is simply using js-mode for now."))

(use-package battle-haxe
  :hook (haxe-mode . battle-haxe-mode)
  :bind (("S-<f4>" . #'pop-global-mark) ;To get back after visiting a definition
         :map battle-haxe-mode-map
         ("<f4>" . #'battle-haxe-goto-definition)
         ("<f12>" . #'battle-haxe-helm-find-references))
  :custom
  (battle-haxe-yasnippet-completion-expansion t "Keep this if you want yasnippet to expand completions when it's available.")
  (battle-haxe-immediate-completion nil "Toggle this if you want to immediately trigger completion when typing '.' and other relevant prefixes."))

(use-package yasnippet
  :ensure t
  :diminish
  :config (yas-global-mode t))

(use-package flycheck
  :ensure t
  :diminish
  :config (global-flycheck-mode))

(use-package markdown-mode
  :ensure t)

;; Variable customizations
(setq mouse-yank-at-point t)
(setq-default indent-tabs-mode nil)
(global-display-line-numbers-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'py-isort-before-save)
