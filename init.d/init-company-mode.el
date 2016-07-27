(require 'use-package)

(use-package company
  :diminish company-mode
  :bind ("TAB" . company-indent-or-complete-common)
  :init
  (global-company-mode)
  (setq company-tooltip-align-annotations t))

;; hacky workaround for fci-mode
(defun on-off-fci-before-company(command)
  (when (string= "show" command)
    (turn-off-fci-mode))
  (when (string= "hide" command)
    (turn-on-fci-mode)))

(advice-add 'company-call-frontends :before #'on-off-fci-before-company)

(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-max-lines 20))

(use-package helm-company
  :after company
  :bind (:map company-active-map
              ("M-h" . helm-company)))

(provide 'init-company-mode)
