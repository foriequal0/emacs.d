(req-package flycheck-rust
  :require flycheck
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(req-package rust-mode
  :require company
  :mode ("\\.rs\\'" . rust-mode)
  :init (progn
	  (setq racer-rust-src-path "~/src/rustc/src")
	  (setq racer-cmd "~/bin/racer/target/release/racer")
	  (add-to-list 'load-path "~/bin/racer/editors")))

(req-package racer
  :require rust-mode)

(provide 'init-rust)
