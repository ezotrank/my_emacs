(add-to-path 'packages/ruby-mode)

;; For brackets and nice ruby code style
(require 'ruby-electric)

;; Comment this, coz with this don't work feature-mode
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; Some nice func
(defun ruby-eval-buffer () (interactive)
    "Evaluate the buffer with ruby."
    (shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
  (font-lock-mode t)
     (setq standard-indent 2)
     (ruby-electric-mode t)
     (define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; Load inf-ruby(use to debug and open irb)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             ))

(add-to-path 'packages/rhtml)
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . rhtml-mode))

(add-to-path 'packages/cucumber)
(require 'feature-mode)
(setq feature-default-language "en")
(setq feature-default-i18n-file "~/.emacs.d/packages/cucumber/i18n.yml")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))
