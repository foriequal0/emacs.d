(require 'req-package)

(req-package octave-mode
  :mode "\\.m\\'"
  :require ac-octave)

(req-package ac-octave)

(provide 'init-octave)
