(req-package elm-mode
  :mode ("\\.elm\\'" . elm-mode)
  :require company
  :config (progn
            (elm-oracle-setup-completion)
            (setq indent-tabs-mode nil)))

(provide 'init-elm)
