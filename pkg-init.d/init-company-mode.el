(req-package company
  :init (add-hook 'after-init-hook #'global-company-mode)
  :config (progn
            (diminish 'company-mode)
            (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
            (setq company-tooltip-align-annotations t)))

(provide 'init-company-mode)
