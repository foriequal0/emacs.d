(require 'use-package)

;; hacky workaround for fci-mode
(defun on-off-fci-before-company(command)
  (when (string= "show" command)
    (auto-fci-mode-supress))
  (when (string= "hide" command)
    (auto-fci-mode-recover)))

(use-package company
  :diminish company-mode
  :bind (("TAB" . company-indent-or-complete-common)
         :map company-mode-map
         ("M-n" . company-manual-begin)
         ("M-p" . company-manual-begin))
  :init
  (global-company-mode)
  (setq company-tooltip-align-annotations t
        company-selection-wrap-around t)
  (advice-add 'company-call-frontends :before #'on-off-fci-before-company))

(use-package company-flx
  :after company
  :config
  (company-flx-mode +1))

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
