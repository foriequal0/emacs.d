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
(use-package f)
(use-package s)
(use-package dash)
(use-package better-defaults)
(use-package db
  :config
  (defvar config-db
    (db-make '(db-hash :filename "~/.emacs.d/config-db"))))

(defconst package-list-update-interval (days-to-time 2))

(let ((last-check (db-get "package-last-update" config-db))
      (current (current-time)))
  (if last-check
      (let ((since-last-check (time-subtract current last-check)))
        (when (time-less-p package-list-update-interval since-last-check)
          (progn
            (message "package-archive-contents too old (%d days)"
                     (time-to-number-of-days since-last-check))
            (package-refresh-contents)
            (db-put "package-last-update" current config-db))))
    (db-put "package-last-update" current config-db)))

(defun load-directory (directory)
  (let* ((files (f-files directory))
         (modules (-distinct (-map 'f-no-ext files)))
         (nonhiddens (-filter (lambda (path)
                                (not (string-prefix-p "." (f-base path))))
                              modules)))
    (dolist (module nonhiddens)
      (unless (ignore-errors (load module))
        (warn "Failed to load %s" module)))))

(provide 'package-prepare)
