(require 'use-package)

(use-package company
  :diminish company-mode
  :commands comapny-mode
  :bind ("TAB" . company-indent-or-complete-common)
  :init
  (global-company-mode)
  (setq company-tooltip-align-annotations t))

(provide 'init-company-mode)
