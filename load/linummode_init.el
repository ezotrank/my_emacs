;Line number
(require 'linum)
(add-hook 'emacs-lisp-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'python-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'yaml-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'django-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'html-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'ruby-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'rails-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'feature-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'rspec-mode-hook
     '(lambda() (linum-mode 1)))
