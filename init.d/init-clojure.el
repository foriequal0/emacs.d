(require 'use-package)

(use-package clojure-mode
  :mode "\\.clj\\'")

(use-package cider
  :after clojure-mode
  :config (cider-mode 1))

(provide 'init-clojure.el)
