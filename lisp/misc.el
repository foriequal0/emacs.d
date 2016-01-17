
(defvar on-reload nil)

;;;###autoload
(defun reload-emacs-d ()
  "reload your .emacs.d/init.el without restarting emacs"
  (interactive)
  (setq on-reload t)
  (load-file "~/.emacs.d/init.el"))

;;;###autoload
(defun emacs ()
  (interactive)
  (start-process "Emacs" nil (executable-find "emacs")))

(provide 'misc)
