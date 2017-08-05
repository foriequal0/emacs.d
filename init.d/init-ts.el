(require 'use-package)

(use-package typescript-mode
  :mode "\\.ts\\'")

(defun setup-tide-mode()
  (interactive)
  (tide-setup)
  (tide-hl-identifier-mode 1))

(use-package tide
  :config
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescropt-mode-hook 'setup-tide-moded))
