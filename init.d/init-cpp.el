(require 'use-package)

; it needs CMake, libclang
(use-package irony
  :commands irony-mode
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  (require 'company)
  (require 'company-irony)
  (require 'flycheck-irony)
  (my-irony-mode-hook)
  (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options))

(defun my-irony-mode-hook ()
  "Replace the `completion-at-point' and `complete-symbol' bindings in
 irony-mode's buffer by irony-mode's function"
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(use-package company-irony
  :defer t
  :config
  (require 'irony)
  (add-to-list 'company-backends 'company-irony)
  (company-irony-setup-begin-commands))

(use-package flycheck-irony
  :defer t
  :init
  (require 'flycheck)
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(setq c-default-style "linux"
      c-basic-offset 4)

(provide 'init-cpp)
