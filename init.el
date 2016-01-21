(setq load-prefer-newer t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

(load "package-prepare")
(load "environments")
(load "autoloads")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;(load "restore-window-size")

;; init.d
(require 'load-dir)
(setq load-dirs "~/.emacs.d/init.d/")
(if (boundp 'on-reload)
    (load-dir-reload))
