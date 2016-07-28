(require 'use-package)

(defun my-prefer-ipython ()
  (if (executable-find "ipython")
      (setq python-shell-interpreter "ipython"
            python-shell-interpreter-args "-i --simple-prompt")
    (setq python-shell-interpreter "python"
          python-shell-interpreter-args "-i")))

(defvar python-mode-pre-hook nil)

(defvar python-mode-post-hook nil)

(defun python-mode-advice (orig-fun &rest args)
  (run-hooks 'python-mode-pre-hook)
  (apply orig-fun args)
  (run-hooks 'python-mode-post-hook))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (advice-add 'python-mode :around #'python-mode-advice)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(use-package elpy
  :after python
  :config
  (setq elpy-modules (remove 'elpy-module-highlight-indentation elpy-modules))
  (elpy-enable))

(use-package pyvenv
  :after python
  :init
  ;; fallback pyvenv
  (setq pyvenv-activate "~/.emacs.d/.pyvenv")
  :config
  (add-hook 'python-mode-post-hook (lambda() (pyvenv-activate pyvenv-activate)))
  (add-hook 'pyvenv-post-activate-hooks #'my-prefer-ipython)
  (add-hook 'pyvenv-post-deactivate-hooks #'my-prefer-ipython))

(use-package company-jedi
  :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
