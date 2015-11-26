(require 'req-package)

(req-package flycheck
  :diminish flycheck-mode
  :init (add-hook 'after-init-hook #'global-flycheck-mode)
  :config (progn
            (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))

(provide 'init-flycheck)
