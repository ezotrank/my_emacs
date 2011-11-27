;; Comment this, coz with this don't work feature-mode
(add-to-path 'elpa/ruby-mode-1.1)
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; For brackets and nice ruby code style
(add-to-path 'elpa/ruby-electric-1.1)
(require 'ruby-electric)

;; For insert end
(add-to-path 'elpa/ruby-end-0.0.2)
(require 'ruby-end)
(require 'ruby-block)

(defun prelude-ruby-mode-hook ()
  (prelude-coding-hook)
  ;; turn off the annoying input echo in irb
  (setq comint-process-echoes t)
  (ruby-block-mode t)
)

(add-hook 'ruby-mode-hook 'prelude-ruby-mode-hook)

;; Load Rhtml mode
(add-to-path 'packages/rhtml)
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . rhtml-mode))
;; Disable abbrev mode for rhtml, becouse very bad with "<%="
(add-hook 'rhtml-mode-hook
          '(lambda ()
             (abbrev-mode 0)
             )
          )

;; Load Cucumber mode
(add-to-path 'packages/cucumber)
(require 'feature-mode)
(setq feature-default-language "en")
(setq feature-default-i18n-file "~/.emacs.d/packages/cucumber/i18n.yml")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; Load HAML mode
(add-to-path 'elpa/haml-mode-3.0.14)
(require 'haml-mode)
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; Load Rspec mode
(add-to-path 'packages/rspec)
(require 'mode-compile)
(require 'rspec-mode)

;; ;; Some nice func
;; (defun ruby-eval-buffer () (interactive)
;;     "Evaluate the buffer with ruby."
;;     (shell-command-on-region (point-min) (point-max) "ruby"))

;; (defun my-ruby-mode-hook ()
;;   (font-lock-mode t)
;;      (setq standard-indent 2)
;;      (ruby-electric-mode t)
;;      (define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
;; (add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; ;; Load inf-ruby(use to debug and open irb)
;; (autoload 'run-ruby "inf-ruby"
;;   "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (inf-ruby-keys)
;;              ))

