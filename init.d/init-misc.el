(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (when (not (display-graphic-p))
	      (if (fboundp 'menu-bar-mode)
		  (menu-bar-mode -1)))))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... ;; I need this.
(setq inhibit-startup-message t)

;; display time on console.
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " "))))
(display-time-mode 1)

(display-battery-mode 1)

(global-auto-revert-mode 1)

(setq-default indent-tabs-mode t)
(add-hook 'emacs-lisp-mode-hook (lambda () indent-tabs-mode nil))
(add-hook 'lisp-mode-hook (lambda () indent-tabs-mode nil))

(req-package switch-window
  :config (global-set-key (kbd "C-x o") 'switch-window))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(req-package iresize)

(req-package ibuffer-projectile
  :config (add-hook 'ibuffer-hook
		    (lambda ()
		      (ibuffer-projectile-set-filter-groups)
		      (unless (eq ibuffer-sorting-mode 'alphabetic)
			        (ibuffer-do-sort-by-alphabetic)))))

(req-package projectile
  :config (projectile-global-mode))
(req-package magit
  :config (setq magit-last-seen-setup-instructions "1.4.0"))

(req-package helm
  :config (progn
	    (require 'helm-config)
	    (helm-mode 1)
	    (helm-autoresize-mode 1)))

(req-package neotree
  :config (progn
	    (global-set-key [f8] 'neotree-toggle)))

(provide 'init-misc)
