(require 'use-package)

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
;(display-time-mode 1)

;(display-battery-mode 1)

(global-auto-revert-mode 1)

(setq-default indent-tabs-mode t)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))

(defun close-and-kill-this-pane ()
  "If there are multiple windows, then close this pane and kill the buffer in it also."
  (interactive)
  (kill-this-buffer)
  (if (not (one-window-p))
      (delete-window)))

(global-set-key (kbd "C-x )") 'close-and-kill-this-pane)
(global-set-key (kbd "C-x C-c")
                (lambda ()
                  (interactive)
                  (if (delete-frame-enabled-p)
                      (delete-frame)
                    (save-buffers-kill-emacs))))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq default-input-method "korean-hangul")
(global-set-key (kbd "<Hangul>") 'toggle-input-method)

(use-package macrostep
  :bind ("C-c e" . macrostep-expand))

(use-package switch-window
  :bind ("C-x o" . switch-window))

(use-package iresize
  :bind ("C-c i" . iresize-mode))

(use-package fill-column-indicator
  :init
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda ()
      (if (and
           (not (string-match "^\*.*\*$" (buffer-name)))
           (not (eq major-mode 'dired-mode))
           (not (eq major-mode 'helm-mode))
           (not (eq major-mode 'neotree-mode)))
          (fci-mode 1))))
  (global-fci-mode 1)
  :config
  (setq fci-rule-column 80)
  (defun auto-fci-mode (&optional unused)
    (if (> (window-width) fci-rule-column)
        (fci-mode 1)
      (fci-mode 0)))
  (add-hook 'after-change-major-mode-hook 'auto-fci-mode)
  (add-hook 'window-configuration-change-hook 'auto-fci-mode))

(use-package ibuffer-projectile
  :config (add-hook 'ibuffer-hook
		    (lambda ()
		      (ibuffer-projectile-set-filter-groups)
		      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode))

(use-package magit
  :defer t)

(use-package helm
  :diminish helm-mode
  :demand
  :bind ("M-x" . helm-M-x)
  :bind ("C-x C-f" . helm-find-files)
  :config
  (require 'helm-config)
  ;; to silence ad-redefinition-action 
  (setq ad-redefinition-action 'accept)
  (helm-mode t)
  (helm-autoresize-mode 1)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t))

(use-package neotree
  :bind ("<f8>" . neotree-toggle)
  :config
  (setq neo-theme 'nerd)
  (setq neo-smart-open t))

(use-package dired+
  :config
  (define-key dired-mode-map [mouse-2] #'diredp-mouse-find-file-reuse-dir-buffer)
  (define-key dired-mode-map [S-mouse-2] #'diredp-mouse-find-file-other-frame)
  (diredp-toggle-find-file-reuse-dir 1))

(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0))
  :config
  (avy-setup-default))

(use-package markdown-mode
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(provide 'init-misc)
