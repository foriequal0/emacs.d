(req-package haskell-mode
  :mode "\\.hs$"
  :config (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)))

(req-package shm
  :config (progn (add-hook 'haskell-mode-hook 'structured-haskell-mode)))

(req-package flycheck-haskell
  :require flycheck
  :init (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))


(provide 'init-haskell)
