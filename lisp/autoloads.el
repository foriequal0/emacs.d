(defvar loaddef-file-path "~/.emacs.d/lisp/loaddef.el")

(defun update-autoloads (loaddef &rest DIRS)
  "update-directory-autoloads wrapper"
  (interactive)
  (let ((generated-autoload-file loaddef))
    (apply 'update-directory-autoloads DIRS)))

(when (not (file-exists-p loaddef-file-path))
  (update-autoloads loaddef-file-path "~/.emacs.d/lisp/"))

(load loaddef-file-path)

(provide 'autoloads)
