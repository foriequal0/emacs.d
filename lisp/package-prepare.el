(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
        ("org" . "http://orgmode.org/elpa/")
        ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(dolist (p '(use-package))
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
(use-package better-defaults)

(provide 'package-prepare)
