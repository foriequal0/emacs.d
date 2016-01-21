(require 'use-package)

(use-package elm-mode
  :mode ("\\.elm\\'" . elm-mode)
  :config
  (require 'company)
  (elm-oracle-setup-completion)
  (setq indent-tabs-mode nil))

(provide 'init-elm)
