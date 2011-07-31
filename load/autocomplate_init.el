(add-to-list 'load-path "~/.emacs.d/packages/autocomplete")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/packages/autocomplete/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu nil)
(global-auto-complete-mode t)



;; (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
;; (add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
;; (global-auto-complete-mode t)
;; (set-face-background 'ac-candidate-face "lightgray")
;; (set-face-underline 'ac-candidate-face "darkgray")
;; (set-face-background 'ac-selection-face "steelblue")
;; (define-key ac-completing-map "\M-n" 'ac-next)
;; (define-key ac-completing-map "\M-p" 'ac-previous)
;; (setq ac-auto-start nil)
;; (setq ac-dwim t)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


