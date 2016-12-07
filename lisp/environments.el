(require 'f)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))

(unless (f-directory? "~/.emacs.d/auto-save-list/")
    (f-mkdir "~/.emacs.d/auto-save-list"))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(setq backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 6   ; how many of the newest versions to keep
      kept-old-versions 2    ; and how many of the old
      )

(global-set-key (kbd "C-z") (lambda() (interactive) (unless window-system (suspend-frame))))

(provide 'environments)
