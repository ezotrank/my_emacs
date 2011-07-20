(setq load-path (cons "~/.emacs.d/packages/org-mode/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; (custom-set-variables
;;  '(org-directory "~/org")
;;  '(org-default-notes-file "~/org/notes")
;;  )

(setq org-agenda-files
      (list "~/org/todos.org" 
            "~/org/alisa_comments.org"
            "~/home/ezo/org/notes.org"))

;; logging stuff
(setq org-log-done (quote time))
(setq org-log-into-drawer nil)
(setq org-log-redeadline (quote note))
(setq org-log-reschedule (quote time))


;; To save the clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

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

(defun org-notes()
  (interactive)
  (find-file "~/org/notes.org")
)

(defun org-agenda-file()
  (interactive)
  (find-file "~/org/agenda.org")
)

;; Some hooks
(add-hook 'org-mode-hook '(lambda () 
                            (auto-fill-mode)
                            (flyspell-mode)
                            )
          )
