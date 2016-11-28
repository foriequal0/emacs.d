(package-initialize)

(setq load-prefer-newer t)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load "package-prepare")
(load "environments")
(load "autoloads")

(load "~/.emacs.d/custom.el" 'noerror)
;; (load "restore-window-size")

(load-directory "~/.emacs.d/init.d")
