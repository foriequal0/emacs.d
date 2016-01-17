(require 'f)

(defvar paths-default-initialized nil)

(defvar paths-default-path-string nil)

(defvar paths-default-exec-path nil)

(unless paths-default-initialized
  (setq paths-default-path-string (getenv "PATH"))
  (setq paths-default-exec-path exec-path)
  (setq paths-default-initialized t))

(defun paths-restore-default ()
  "restores it. yeah"
  (interactive)
  (setenv "PATH" paths-default-path-string)
  (setq exec-path paths-default-exec-path))

(defun paths-add (&rest paths)
  "add-it"
  (interactive)
  (dolist (path paths)
    (let ((full-path (expand-file-name path)))
      (setenv "PATH" (concat path ":" (getenv "PATH")))
      (add-to-list 'exec-path path))))

(provide 'paths)
