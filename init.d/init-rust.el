(require 'use-package)
(require 'dash)

(use-package rust-mode
  :mode "\\.rs\\'"
  :config
  (add-hook 'rust-mode-hook 'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'racer-mode))

(use-package flycheck-rust
  :defer t)

(defun shell-cmd (prefix suffix)
  (-when-let* ((output-raw (shell-command-to-string (concat prefix suffix))))
    (replace-regexp-in-string "\n\\'" "" output-raw)))

(use-package racer
  :defer t
  :config
  (-when-let* ((rustup (executable-find "rustup"))
               (rustc (shell-cmd rustup " which rustc"))
               (racer (executable-find "racer")))
    (let* ((sysroot (shell-cmd rustc " --print sysroot")))
      (setq racer-rust-src-path (concat sysroot "/lib/rustlib/src/rust/src"))
      (setq racer-cmd racer))))

;(use-package lsp-rust)

(provide 'init-rust)
