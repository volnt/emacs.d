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
  :bind ("C-c s" . magit-status))

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
