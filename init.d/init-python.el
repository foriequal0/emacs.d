(require 'use-package)

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package elpy
  :defer t
  :after python
  :config
  (pyvenv-activate "~/.pyvenv")
  (elpy-enable))

(use-package company-jedi
  :after python-mode
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
