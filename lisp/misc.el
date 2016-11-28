
;;;###autoload
(defun emacs (path)
  (interactive "GFind file or url: ")
  (start-process "Emacs" nil (executable-find "emacs") path))

(provide 'misc)
