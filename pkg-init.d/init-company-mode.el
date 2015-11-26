(require 'req-package)

(req-package company
  :diminish company-mode
  :init (add-hook 'after-init-hook #'global-company-mode)
  :config (progn
            (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
            (setq company-tooltip-align-annotations t)))

(provide 'init-company-mode)
