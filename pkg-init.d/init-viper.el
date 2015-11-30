(require 'req-package)

(req-package viper-cmd
  :init (progn
          (global-set-key (kbd "M-f") 'viper-forward-word)
	  (global-set-key (kbd "M-b") 'viper-backward-word)))

(provide 'init-viper)
