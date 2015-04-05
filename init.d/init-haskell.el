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

;; install cabal-install < 1.22 when ghc < 7.10
;; tested with cabal-install == 1.20, ghc 7.8.2
(req-package ghc
  :require haskell-mode
  :init (progn (autoload 'ghc-init "ghc" nil t)
	       (autoload 'ghc-debug "ghc" nil t)
	       (add-hook 'haskell-mode-hook (lambda () (ghc-init)))))

(req-package company-ghc
  :require (company ghc)
  :init (progn (add-hook 'haskell-mode-hook 'company-mode)
	       (add-to-list 'company-backends 'company-ghc)
	       (custom-set-variables '(company-ghc-show-info t))))

(provide 'init-haskell)
