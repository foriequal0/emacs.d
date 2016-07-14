(require 'use-package)

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(use-package elpy
  :after python
  :config
  (pyvenv-activate "~/.pyvenv")
  (elpy-enable))

(use-package company-jedi
  :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
