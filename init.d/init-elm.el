(req-package elm-mode
  :require company
  :config (progn
          (elm-oracle-setup-completion))
  :init (progn
          (setq indent-tabs-mode nil)))

(provide 'init-elm)
