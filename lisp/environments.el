(require 'f)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backup/")))

(unless (f-directory? "~/.emacs.d/auto-save/")
    (f-mkdir "~/.emacs.d/auto-save"))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/" t)))

(setq backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 6   ; how many of the newest versions to keep
      kept-old-versions 2    ; and how many of the old
      )

(global-set-key (kbd "C-z") nil)

(provide 'environments)
