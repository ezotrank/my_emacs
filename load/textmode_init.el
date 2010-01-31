;; enabling auto-fill-mode with text-mode
(add-hook 'text-mode-hook
          '(lambda ()
             (auto-fill-mode 1)))

;; enter text-mode when opening a file named 'README', 'INSTALL' and so on
(add-to-list 'auto-mode-alist '("README" . text-mode))
(add-to-list 'auto-mode-alist '("INSTALL" . text-mode))
(add-to-list 'auto-mode-alist '("NEWS" . text-mode))
(add-to-list 'auto-mode-alist '("TODO" . text-mode))
(add-to-list 'auto-mode-alist '("AUTHORS" . text-mode))
(add-to-list 'auto-mode-alist '("THANKS" . text-mode))
(add-to-list 'auto-mode-alist '("COPYING" . text-mode))
