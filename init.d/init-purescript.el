(require 'use-package)

(use-package purescript-mode
  :diminish purescript-indentation-mode
  :mode "\\.purs\\'")

(use-package psc-ide
  :diminish psc-ide-mode
  :defer t)

(use-package psci
  :defer t)

(use-package flycheck-purescript
  :defer t)

(add-hook 'purescript-mode-hook
          (lambda ()
            (flycheck-purescript-setup)
            (psc-ide-mode)
            (turn-on-purescript-indentation)
            (inferior-psci-mode)))

(provide 'init-purescript)
