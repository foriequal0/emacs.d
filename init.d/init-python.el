(require 'use-package)

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (add-hook 'python-mode-hook
            (lambda ()
              (when (executable-find "ipython")
                (setq python-shell-interpreter "ipython"
                      python-shell-interpreter-args "-i --simple-prompt"))))
  :config
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(use-package elpy
  :after python
  :config
  (setq elpy-modules (remove 'elpy-module-highlight-indentation elpy-modules))
  (pyvenv-activate "~/.emacs.d/.pyvenv")
  (elpy-enable))

(use-package company-jedi
  :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
