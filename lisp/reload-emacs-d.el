;;;###autoload
(defun reload-emacs-d ()
  "reload your .emacs.d/init.el without restarting emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(provide 'reload-emacs-d)
