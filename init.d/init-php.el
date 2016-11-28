(require 'use-package)

(use-package php-mode
  :mode "\\.php\\'"
  :mode "\\.inc\\'"
  :config
  (require 'php-ext))

(use-package company-php
  :defer t
  :init
  (add-to-list 'company-backends 'company-ac-php-backend))

(add-hook 'php-mode-hook
          (lambda ()
            (define-key php-mode-map [tab] 'company-indent-or-complete-common)))
