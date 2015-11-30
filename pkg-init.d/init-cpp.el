(require 'req-package)

; it needs CMake, libclang
(req-package irony
  :require company
  :init (progn (add-hook 'c++-mode-hook 'irony-mode)
	       (add-hook 'c-mode-hook 'irony-mode)
	       (add-hook 'objc-mode-hook 'irony-mode)
	       
	       (add-hook 'irony-mode-hook 'my-irony-mode-hook)
	       (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(defun my-irony-mode-hook ()
  "Replace the `completion-at-point' and `complete-symbol' bindings in irony-mode's buffer by irony-mode's functino"
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(req-package company-irony
  :require company
  :init (progn (eval-after-load 'company
		 '(add-to-list 'company-backends 'company-irony))
	       (add-hook 'irony-mode-hook 
			 'company-irony-setup-begin-commands)))

(req-package flycheck-irony
  :require flycheck
  :init (progn (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(setq c-default-style "linux"
      c-basic-offset 4)

(provide 'init-cpp)
