(require 'use-package)

(use-package noflet)

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
(setq gdb-many-windows t)

(global-auto-revert-mode 1)

(setq-default indent-tabs-mode t)
(defconst indent-space-mode-hooks
        '(emacs-lisp-mode-hook
          lisp-mode-hook
          lua-mode-hook))
(dolist (hook indent-space-mode-hooks)
  (message (symbol-name hook))
  (add-hook hook (lambda () (setq indent-tabs-mode nil))))

(use-package dtrt-indent
  :diminish dirt-indent-mode
  :config (dtrt-indent-mode 1))

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
(global-set-key (kbd "C-J") 'join-line)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq default-input-method "korean-hangul")
(global-set-key (kbd "<Hangul>") 'toggle-input-method)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))
      mouse-wheel-progressive-speed 5
      scroll-step 3)

(defun mwheel-scroll-advice (orig-fun event)
  (if mouse-wheel-progressive-speed
      (if (integerp mouse-wheel-progressive-speed)
          (let* ((max-amt mouse-wheel-progressive-speed)
                 (saturate (lambda (&optional value)
                             (if (and value (integer-or-marker-p value))
                                 (if (<= value max-amt) value max-amt)
                               value))))
            (noflet ((scroll-up (&optional amt) (funcall this-fn (funcall saturate amt)))
                     (scroll-down (&optional amt) (funcall this-fn (funcall saturate amt))))
              (funcall orig-fun event)))
        (funcall orig-fun event))
    (funcall orig-fun event)))

(advice-add #'mwheel-scroll :around #'mwheel-scroll-advice)

(use-package macrostep
  :bind ("C-c e" . macrostep-expand))

(use-package switch-window
  :bind ("C-x o" . switch-window))

(use-package buffer-move
  :bind (("<C-S-up>" . buf-move-up)
         ("<C-S-down>" . buf-move-down)
         ("<C-S-left>" . buf-move-left)
         ("<C-S-right>" . buf-move-right)))

(use-package iresize
  :bind ("C-c i" . iresize-mode))

(define-key dired-mode-map (kbd "RET")
  'dired-find-alternate-file) ; was dired-advertised-find-file

(define-key dired-mode-map (kbd "^")
  (lambda () (interactive) (find-alternate-file "..")))
;; was dired-up-directory

(defvar auto-fci-mode-supressed nil)

(defun auto-fci-mode--auto-toggle (&optional unused)
  (unless auto-fci-mode-supressed
    (unless (or
             (string-match "^\*.*\*$" (buffer-name))
             (eq major-mode 'dired-mode)
             (eq major-mode 'helm-mode)
             (eq major-mode 'neotree-mode))
      (if (> (window-width) fci-rule-column)
          (fci-mode 1)
        (fci-mode 0)))))

(defun auto-fci-mode-supress ()
  (setq auto-fci-mode-supressed t)
  (fci-mode 0))

(defun auto-fci-mode-recover ()
  (setq auto-fci-mode-supressed nil)
  (setq fci-handle-truncate-lines nil
        truncate-lines nil)
  (auto-fci-mode--auto-toggle))

(define-minor-mode auto-fci-mode
  nil nil nil nil
  (if auto-fci-mode
      (progn
        (add-hook 'after-change-major-mode-hook 'auto-fci-mode--auto-toggle nil t)
        (add-hook 'window-configuration-change-hook 'auto-fci-mode--auto-toggle nil t)
        (add-hook 'window-size-change-functions 'auto-fci-mode--auto-toggle nil t)
        (auto-fci-mode--auto-toggle))
    (remove-hook 'after-change-major-mode-hook 'auto-fci-mode--auto-toggle t)
    (remove-hook 'window-configuration-change-hook 'auto-fci-mode--auto-toggle t)
    (remove-hook 'window-size-change-functions 'auto-fci-mode--auto-toggle t)))

(define-globalized-minor-mode global-auto-fci-mode auto-fci-mode auto-fci-mode)

(use-package fill-column-indicator
  :init
  (setq fci-rule-column 80)
  (global-auto-fci-mode 1))

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

(defun multi-term-dedicated-select-or-open ()
  (interactive)
  (if (multi-term-dedicated-window-p)
      (pop-to-buffer (other-buffer (current-buffer) 1))
    (unless (multi-term-dedicated-exist-p)
      (multi-term-dedicated-open))
    (multi-term-dedicated-select)))

(use-package multi-term
  :bind ("C-c C-x" . multi-term-dedicated-select-or-open)
  :init (require 'multi-term))

(use-package diff-hl
  :init (global-diff-hl-mode)
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package helm
  :diminish helm-mode
  :defer 1
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config
  (require 'helm-config)
  (setq helm-M-x-fuzzy-match t
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t)
  ;; to silence ad-redefinition-action
  (setq ad-redefinition-action 'accept)
  (helm-mode t)
  (helm-autoresize-mode 1))

(use-package shackle
  :config
  (shackle-mode 1)
  (setq shackle-rules
        '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4))))

(use-package neotree
  :bind ("<f8>" . neotree-toggle)
  :config
  (setq neo-theme 'ascii)
  (setq neo-smart-open t))

(defun my-dired-init()
  "Bunch of stuff to run for dired, either immediately or when it's loaded."
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-2] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^" (lambda () (interactive) (dired-single-buffer ".."))))

(use-package dired-single
  :init
  (if (boundp 'dired-mode-map)
      (my-dired-init)
    (add-hook 'dired-load-hook 'my-dired-init)))

(use-package avy
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (avy-setup-default))

(use-package markdown-mode
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(use-package lisp-mode
  :ensure nil
  :bind (:map emacs-lisp-mode-map
              ("M-." . find-function)))

(use-package lua-mode
  :mode "\\.lua\\'"
  :interpreter "lua")

(use-package groovy-mode
  :mode (("\\.groovy\\'" . groovy-mode)))

(use-package gradle-mode
  :mode "\\.gradle\\'"
  :config (add-hook 'gradle-mode-hook 'groovy-mode))

(use-package adoc-mode
  :mode "\\.adoc\\'")

(defun buffer-binary-p (&optional buffer)
  "Return whether BUFFER or the current buffer is binary.

A binary buffer is defined as containing at least on null byte.

Returns either nil, or the position of the first null byte."
  (with-current-buffer (or buffer (current-buffer))
    (save-excursion
      (goto-char (point-min))
      (search-forward (string ?\x00) nil t 1))))

(defun hexl-if-binary ()
  "If `hexl-mode' is not already active, and the current buffer
is binary, activate `hexl-mode'."
  (interactive)
  (unless (eq major-mode 'hexl-mode)
    (when (buffer-binary-p)
      (hexl-mode))))

(add-hook 'find-file-hooks 'hexl-if-binary)

(use-package company-coq
  :if (load "~/.emacs.d/PG/generic/proof-site" 'noerror)
  :config
  (add-hook 'coq-mode-hook 'company-coq-mode))

(provide 'init-misc)
