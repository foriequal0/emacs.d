(require 'use-package)
(require 'dash)

(use-package rust-mode
  :mode "\\.rs\\'"
  :config
  (add-hook 'rust-mode-hook 'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'racer-mode))

(use-package flycheck-rust
  :defer t)

(use-package racer
  :defer t
  :config
  (-when-let* ((rustc (executable-find "rustc"))
               (racer (executable-find "racer")))
    (let* ((sysroot-raw (shell-command-to-string
                         (concat rustc " --print sysroot")))
           (sysroot (replace-regexp-in-string "\n\\'" "" sysroot-raw)))
      (setq racer-rust-src-path (concat sysroot "/lib/rustlib/src/rust/src"))
      (setq racer-cmd racer))))

(provide 'init-rust)
