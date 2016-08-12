(require 'use-package)
(require 'paths)

(paths-add "~/.local/bin")

(defun haskell--mark-navigate-imports()
  (interactive)
  (push-mark)
  (haskell-navigate-imports))

(use-package haskell-mode
  :mode "\\.hs\\'"
  :config
  (bind-keys :map haskell-mode-map
             ("<f9>" . haskell--mark-navigate-imports))
  ;; require 'cabal install hasktags'
  ;; (custom-set-variables '(haskell-tags-on-save t))
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4)

  (add-hook 'haskell-mode-hook #'haskell-doc-mode))

(use-package intero
  :init
  (add-hook 'haskell-mode-hook #'intero-mode))

(provide 'init-haskell)
