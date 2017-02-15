;(package-initialize)

(setq load-prefer-newer t)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load "package-prepare")
(load "environments")
(load "autoloads")
(load "~/.emacs.d/custom.el" 'noerror)
;; (load "restore-window-size")

(load-directory "~/.emacs.d/init.d")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-php yaml-mode web-mode use-package undo-tree switch-window shackle racer psci psc-ide php-mode noflet neotree multi-term markdown-mode magit macrostep lua-mode iresize intero ibuffer-projectile helm-company groovy-mode gradle-mode flycheck-rust flycheck-purescript flycheck-irony fill-column-indicator elpy elm-mode dummy-h-mode dockerfile-mode dired-single diff-hl db company-quickhelp company-jedi company-irony company-flx clang-format cider buffer-move better-defaults avy adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
