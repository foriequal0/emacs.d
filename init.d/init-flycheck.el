(req-package flycheck
  :init (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-flycheck)
