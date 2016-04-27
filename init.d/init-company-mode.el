(require 'use-package)

(use-package company
  :diminish company-mode
  :commands comapny-mode
  :bind ("TAB" . company-indent-or-complete-common)
  :init
  (global-company-mode)
  (setq company-tooltip-align-annotations t)
  :config
  (company-quickhelp-mode 1))
    
(use-package company-quickhelp
  :commands company-quickhelp-mode)

(provide 'init-company-mode)
