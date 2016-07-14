(require 'use-package)

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package flycheck-rust
  :after rust-mode
  :config (flycheck-rust-setup))

(use-package racer
  :after rust-mode
  :init
  (setq racer-rust-src-path "~/src/rustc/src")
  (setq racer-cmd "~/bin/racer/target/release/racer")
  :config
  (racer-mode))

(provide 'init-rust)
