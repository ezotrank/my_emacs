(add-to-list 'load-path "~/.emacs.d/packages/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))
