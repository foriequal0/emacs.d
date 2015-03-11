(require 'cl)
(require 'package)

;; bootstrap utils

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/init-real.el")
