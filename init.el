;; Set custom file location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load use-package
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package/")
  (require 'use-package))

;; Install and setup packages
(use-package magit
  :ensure t
  :bind ("C-c s" . magit-status))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package multiple-cursors
  :ensure t
  :bind ("C-c m" . mc/mark-all-in-region))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
