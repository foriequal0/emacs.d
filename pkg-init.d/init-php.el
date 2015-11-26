(require 'req-package)

(req-package php-mode
  :mode "\\.php\\'"
  :mode "\\.inc\\'"
  :init (eval-after-load 'php-mode '(require 'php-ext)))
