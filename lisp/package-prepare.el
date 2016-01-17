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

(defvar must-have-packges
  '('use-package))

(dolist (p must-have-packges)
  (unless (package-installed-p p)
    (if (assoc p package-archive-contents)
        (package-install p))))

(require 'use-package)
(setq use-package-always-ensure t)

;; super important packages.
(use-package load-dir)
(use-package f)
(use-package s)
(use-package dash)
(use-package auto-compile
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(provide 'package-prepare)
