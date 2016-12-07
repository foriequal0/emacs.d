(require 'use-package)

(defun my-prefer-ipython ()
  (if (executable-find "ipython")
      (setq python-shell-interpreter "ipython"
            python-shell-interpreter-args "-i --simple-prompt")
    (setq python-shell-interpreter "python"
          python-shell-interpreter-args "-i")))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (add-hook 'python-mode-hook
            (lambda ()
              (my-prefer-ipython)
              (add-hook 'before-save-hook 'delete-trailing-whitespace))))

(use-package elpy
  :after python
  :config
  (setq elpy-modules (remove 'elpy-module-highlight-indentation elpy-modules))
  (setq elpy-rpc-backend "jedi")
  (elpy-enable))

(use-package company-jedi
  :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package auto-virtualenv
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))

(provide 'init-python)
