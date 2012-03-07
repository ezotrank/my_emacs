(global-set-key (kbd "M-TAB") 'indent-region)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; Magit rules!
(global-set-key (kbd "C-x g") 'magit-status)

;; search with google
(global-set-key (kbd "C-c g") 'prelude-google)

;; open in external application
(global-set-key (kbd "C-c o") 'prelude-open-with)

;; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; I don't like Ctrl-Z
(global-set-key (kbd "C-z") (lambda ()
                               (interactive)
                               (message "Brrrr... C-z")))

;; real Emacs hackers don't use the arrow keys
(global-set-key (kbd "<up>") (lambda ()
                               (interactive)
                               (message "Arrow key navigation is disabled. Use C-p instead.")))
(global-set-key (kbd "<down>") (lambda ()
                                 (interactive)
                                 (message "Arrow key navigation is disabled. Use C-n instead.")))
(global-set-key (kbd "<left>") (lambda ()
                                 (interactive)
                                 (message "Arrow key navigation is disabled. Use C-b instead.")))
(global-set-key (kbd "<right>") (lambda ()
                                  (interactive)
                                  (message "Arrow key navigation is disabled. Use C-f instead.")))

(global-set-key (kbd "M-g") 'goto-line)


(provide 'ezo-keybind)
