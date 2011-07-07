(setq rsense-home (expand-file-name "~/.emacs.d/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c .") 'ac-complete-rsense)))
