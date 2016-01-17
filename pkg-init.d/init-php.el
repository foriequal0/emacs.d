(require 'use-package)

(use-package php-mode
  :mode "\\.php\\'"
  :mode "\\.inc\\'"
  :config
  (require 'php-ext))
