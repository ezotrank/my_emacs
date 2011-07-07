(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

(defun my-mail-mode-hook ()
  (auto-fill-mode 1)
  (abbrev-mode 1))
(add-hook 'mail-mode-hook 'my-mail-mode-hook)
