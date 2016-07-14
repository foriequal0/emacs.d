(require 'use-package)

(use-package clang-format
  :commands clang-format-region)

(use-package cc-mode
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.cc\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.c\\'" . c-mode)
         ("\\.h\\'" . c++-mode))
  :config
  (setq c-default-style "linux")
  (setq c-basic-offset 4))

;; detect mode for .h file
(use-package dummy-h-mode
  :mode ("\\.h\\'" . dummy-h-mode)
  :config
  (setq dummy-h-mode-default-major-mode 'c++-mode)
  (setq dummy-h-mode-search-limit 60000))

; it needs CMake, libclang
(use-package irony
  :defer t
  :diminish irony-mode
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  :config
; Replace the `completion-at-point' and `complete-symbol' bindings in
; irony-mode's buffer by irony-mode's function
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)

  (irony-cdb-autosetup-compile-options))

(use-package company-irony
  :after irony
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :after irony
  :config
  (flycheck-irony-setup))

(provide 'init-cpp)
