(require 'use-package)

(use-package company
  :diminish company-mode
  :bind ("TAB" . company-indent-or-complete-common)
  :init
  (global-company-mode)
  (setq company-tooltip-align-annotations t))

(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode 1))

(provide 'init-company-mode)
