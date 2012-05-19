(global-set-key (kbd "M-c") 'prelude-cleanup-buffer)

(global-set-key (kbd "M-TAB") 'prelude-indent-region-or-buffer)
(global-set-key (kbd "C-x m") 'eshell)
;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))


(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'prelude-google)
(global-set-key (kbd "C-c o") 'prelude-open-with)
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

(global-set-key (kbd "C-3") 'comment-or-uncomment-current-line-or-region)

(provide 'ezo-keybind)
