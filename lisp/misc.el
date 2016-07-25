
;;;###autoload
(defun emacs ()
  (interactive)
  (start-process "Emacs" nil (executable-find "emacs")))

(provide 'misc)
