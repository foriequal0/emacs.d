(req-package flycheck
  :init (add-hook 'after-init-hook #'global-flycheck-mode)
  :config (progn
            (diminish 'flycheck-mode)
            (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))

(provide 'init-flycheck)
