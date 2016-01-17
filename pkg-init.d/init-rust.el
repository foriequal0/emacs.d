(require 'use-package)

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (require 'flycheck-rust)
  (require 'racer)
  (racer-mode))

(use-package flycheck-rust
  :defer t
  :config
  (require 'flycheck)
  (flycheck-rust-setup))

(use-package racer
  :defer t
  :config
  (setq racer-rust-src-path "~/src/rustc/src")
  (setq racer-cmd "~/bin/racer/target/release/racer"))

(provide 'init-rust)
