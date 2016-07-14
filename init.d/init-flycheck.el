(require 'use-package)

(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(provide 'init-flycheck)
