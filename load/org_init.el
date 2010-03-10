(setq load-path (cons "~/.emacs.d/packages/org-mode/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(custom-set-variables
 '(org-default-notes-file "~/org/notes")
 '(org-directory "~/org")
)
;; (setq org-agenda-files (list "~/org/pronix.org"
;;                              "~/org/work.org") 
;;       )


(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
      '((sequence "TODO" "WAIT" "|" "DONE")
        (sequence "ANLZ" "FDEV" "CTST" "RDEV" "UTST" "|" "CNCL" "TRNS")
        )
      )
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("WAIT" . (:foreground "orange" :weight bold))
        ("DONE" . (:foreground "green" :weight bold)))
      )
(global-font-lock-mode 1)
(setq org-log-done t)

(defun org-hotkeys()
  (interactive)
  (find-file "~/org/hotkey.org")
)

;; Some hooks
(add-hook 'org-mode-hook '(lambda () 
                            (auto-fill-mode)
                            (flyspell-mode)
                            )
          )
