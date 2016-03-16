(require 'use-package)

(use-package python-mode
  :defer t
  :config (python-mode))

(use-package elpy
  :mode ("\\.py\\'" . elpy-mode)
  :config
  (elpy-enable)
  (require 'python-mode)
  (require 'company-jedi))

(use-package company-jedi
  :defer t
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
