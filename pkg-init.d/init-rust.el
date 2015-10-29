(require 'req-package)

(req-package flycheck-rust
  :require flycheck
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(req-package rust-mode
  :require company
  :mode ("\\.rs\\'" . rust-mode)
  :init (add-hook 'rust-mode-hook #'racer-mode))

(req-package racer
  :require rust-mode
  :config (progn
	  (setq racer-rust-src-path "~/src/rustc/src")
	  (setq racer-cmd "~/bin/racer/target/release/racer")))

(provide 'init-rust)
