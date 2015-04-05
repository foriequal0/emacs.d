(require 'cl)
(require 'package)


(defun reload-dotemacs-file ()
  "reload your .emacs file without restarting Emacs"
  (interactive) 
  (load-file "~/.emacs.d/init.el"))

(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")
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
               (load-dir-one "~/.emacs.d/init.d")))


;; finish loading packages

(req-package-finish)

