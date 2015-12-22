(require 'package)

(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("elpa" . "http://elpa.gnu.org/")
        ("org" . "http://orgmode.org/elpa/")
        ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

(package-initialize)

(if (null package-archive-contents)
    (package-refresh-contents))

(defun require-package (p)
  (if (null (require p nil t))
      (progn
        (if (assoc p package-archive-contents)
            (package-install p))
        (require p))))

(require-package 'req-package)
(require-package 'load-dir)
(require-package 'f)
(require-package 's)
(require-package 'dash)

(provide 'package-prepare)
