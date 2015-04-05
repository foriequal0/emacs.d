(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(req-package haskell-mode
  :mode "\\.hs$"
  :init (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
	       ;; require 'cabal install hasktags'
	       (custom-set-variables '(haskell-tags-on-save t)))
  :config (progn (define-key haskell-mode-map [f8] 'haskell-navigate-imports)))

;; require 'cabal install structured-haskell-mode'
(req-package shm
  :init (progn (add-hook 'haskell-mode-hook 'structured-haskell-mode))
  :config (progn (set-face-background 'shm-current-face "#eee8d5")
		 (set-face-background 'shm-quarantine-face "lemonchiffon")))

(req-package flycheck-haskell
  :require flycheck
  :init (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))


(provide 'init-haskell)
