(require 'use-package)
(require 'paths)

(paths-add "~/.local/bin")

(defun haskell--mark-navigate-imports()
  (interactive)
  (push-mark)
  (haskell-navigate-imports))

(use-package haskell-mode
  :mode "\\.hs\\'"
  :bind (:map haskell-mode-map
              ("C-c C-z" . haskell-interactive-bring)
              ("M-." . haskell-mode-jump-to-def-or-tag)
              ("<f9>" . haskell--mark-navigate-imports))
  :config
  ;; require 'cabal install hasktags'
  ;; (custom-set-variables '(haskell-tags-on-save t))
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4)

  (add-hook 'haskell-mode-hook #'haskell-doc-mode))

(use-package flycheck-haskell
  :after haskell-mode
  :config
  (flycheck-haskell-setup))

;; require 'stack install ghc-mod'
(use-package ghc
  :commands ghc-init)

(use-package company-ghc
  :after haskell-mode
  :config
  (ghc-init)
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t)))

(provide 'init-haskell)
