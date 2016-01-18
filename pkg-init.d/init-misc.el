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

(use-package switch-window
  :config (global-set-key (kbd "C-x o") 'switch-window))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;(use-package iresize)

(use-package fill-column-indicator
  :commands fci-mode
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
  (setq fci-rule-use-dashes t))

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
  :config
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package helm
  :diminish helm-mode
  :demand
  :bind ("M-x" . helm-M-x)
  :bind ("C-x C-f" . helm-find-files)
  :config
  (require 'helm-config)
  (helm-mode t)
  (helm-autoresize-mode 1)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t))

(use-package neotree
  :config
  (global-set-key (kbd "<f8>") #'neotree-toggle)
  (setq neo-theme 'nerd)
  (setq neo-smart-open t))

(use-package dired+
  :config
  (define-key dired-mode-map [mouse-2] #'diredp-mouse-find-file-reuse-dir-buffer)
  (define-key dired-mode-map [S-mouse-2] #'diredp-mouse-find-file-other-frame)
  (diredp-toggle-find-file-reuse-dir 1))

(use-package avy
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (avy-setup-default))

(provide 'init-misc)
