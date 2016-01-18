(require 'use-package)

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :init
  (add-hook 'rust-mode-hook #'racer-mode) ; direct call in :config doesn't work.
  :config
  (flycheck-rust-setup))

(use-package flycheck-rust
  :commands flycheck-rust-setup)

(use-package racer
  :commands racer-mode
  :init
  (setq racer-rust-src-path "~/src/rustc/src")
  (setq racer-cmd "~/bin/racer/target/release/racer"))

(provide 'init-rust)
