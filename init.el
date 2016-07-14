(setq load-prefer-newer t)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load "package-prepare")
(load "environments")
(load "autoloads")

(load "~/.emacs.d/custom.el" 'noerror)
;(load "restore-window-size")

(setq load-dir-loaded nil)
(load-dir-one "~/.emacs.d/init.d/")
