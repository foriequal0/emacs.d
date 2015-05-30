(require 'cl)
(require 'package)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 6   ; how many of the newest versions to keep
      kept-old-versions 2    ; and how many of the old
      )

(if (eq system-type 'darwin)
    (progn (setq mac-option-key-is-meta nil)
           (setq mac-command-key-is-meta t)
           (setq mac-command-modifier 'meta)
           (setq mac-option-modifier nil)))

(defun reload-dotemacs-file ()
  "reload your .emacs file without restarting Emacs"
  (interactive) 
  (load-file "~/.emacs.d/init.el"))

(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("elpa" . "http://tromey.com/elpa/")
	("org" . "http://orgmode.org/elpa/")
	("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
				  (progn (package-refresh-contents)
					 package-archive-contents)
				package-archive-contents))
		    (AVAIL (assoc package ARCHIVES)))
	       (if AVAIL
		   (package-install package)))
	     (require package))))

;; req-package

(require-package 'req-package)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; init.d

(req-package-force load-dir
  :init (progn (require 'load-dir)
               (add-to-list 'load-dirs "~/.emacs.d/init.d")
               (load-dirs-reload)))

;; finish loading packages

(req-package-finish)

