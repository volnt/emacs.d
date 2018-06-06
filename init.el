;; Set custom file location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(package-initialize)
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package/")
  (require 'use-package))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(use-package magit
  :ensure t
  :bind ("C-c s" . magit-status))
