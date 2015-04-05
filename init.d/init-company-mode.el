(req-package company
  :init (progn (add-hook 'after-init-hook 'global-company-mode)))

(provide 'init-company-mode)
