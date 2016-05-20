(require 'use-package)
(require 'paths)

(paths-add
 "~/.local/bin")

(use-package haskell-mode
  :mode "\\.hs$"
  :bind ("C-c C-z" . haskell-interactive-bring)
  :config
  ;; require 'cabal install hasktags'
  (custom-set-variables '(haskell-tags-on-save t))
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4)
  (define-key haskell-mode-map (kbd "<f9>")
    (lambda ()
      (interactive)
      (push-mark)
      (haskell-navigate-imports)))

  (require 'flycheck)
  (require 'company-ghc)
  (ghc-init)
  (flycheck-haskell-setup)
  (add-hook 'haskell-mode-hook #'haskell-doc-mode t) ; it raises a keymapp error when called directly.
  (add-hook 'haskell-mode-hook
            (lambda () (define-key
                         haskell-mode-map
                         (kbd "M-.")
                         'haskell-mode-jump-to-def-or-tag))))

(use-package flycheck-haskell
  :commands flycheck-haskell-setup)

;; require 'stack install ghc-mod'
(use-package ghc
  :commands ghc-init ghc-debug)

(use-package company-ghc
  :defer t
  :config
  (require 'company)
  (require 'ghc)
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t)))

(provide 'init-haskell)
