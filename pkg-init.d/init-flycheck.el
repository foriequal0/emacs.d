(req-package flycheck
  :init (add-hook 'after-init-hook #'global-flycheck-mode)
  :config (progn
            (diminish 'flycheck-mode)))

(provide 'init-flycheck)
