(require 'use-package)

(use-package clojure-mode
  :mode "\\.clj\\'")

(use-package cider
  :init
  (add-hook 'clojure-mode-hook #'cider-mode))

(provide 'init-clojure.el)
