;; (require 'scss-mode)
;; (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
;; (setq scss-compile-at-save f)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/scss-mode.el"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
