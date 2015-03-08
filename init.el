(require 'package)

;; bootstrap utils

(setq custom-file "~/.emacs.d/custom.el")
(if (file-readable-p custom-file) (load custom-file))

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
