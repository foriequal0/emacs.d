(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))
(load "package-management")
(load "prerequisites")
(load "environments")
(load "autoloads")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(load "restore-window-size")

;; init.d

(require 'load-dir)
(require 'req-package)
(add-to-list 'load-dirs "~/.emacs.d/pkg-init.d/")
(load-dirs-reload)
(req-package-finish)
