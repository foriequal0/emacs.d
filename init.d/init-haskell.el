(req-package haskell-mode
  :mode "\\.hs$"
  :config (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)))

(req-package shm
  :config (progn (add-hook 'haskell-mode-hook 'structured-haskell-mode)))

(req-package flymake-haskell-multi
  :require (flymake haskell-mode)
  :config (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load))

(provide 'init-haskell)
