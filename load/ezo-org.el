(add-to-path 'packages/org/lisp)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

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

;; Some hooks
(add-hook 'org-mode-hook '(lambda () 
                            (auto-fill-mode)
                            (flyspell-mode)
                            )
          )


(provide 'ezo-org)
