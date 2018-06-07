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
	 ("C-c b" . magit-blame)))

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

(use-package py-autopep8
  :ensure t
  :bind ("C-c u" . py-autopep8-buffer)
  :hook (python-mode . py-autopep8-enable-on-save)
  :custom (py-autopep8-options '("--max-line-length=120")))

(use-package py-isort
  :ensure t
  :bind ("C-c i" . py-isort-before-save)
  :custom (py-isort-options '("-w 120")))

(use-package projectile
  :ensure t
  :bind ("C-c f" . projectile-find-file)
  :config (projectile-mode))

(use-package autorevert
  :diminish)

(use-package jedi
  :ensure t
  :bind ("C-c ;" . jedi:goto-definition)
  :hook (python-mode . jedi:setup))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark))

(use-package hl-line
  :ensure t
  :config (global-hl-line-mode))

;; (use-package diff-hl
;;   :ensure t
;;   :config (global-diff-hl-mode))

;; (setq fringes-outside-margins t)

(use-package nlinum
  :ensure t
  :diminish
  :custom ((nlinum-highlight-current-line t)
	   (nlinum-format "%4d"))
  :config (global-nlinum-mode))

(use-package org
  :ensure t
  :bind ("C-c a" . org-agenda))
