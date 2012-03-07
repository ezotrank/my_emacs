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
  ;; turn off the annoying input echo in irb
  (ruby-block-mode t)
)

(add-hook 'ruby-mode-hook 'prelude-ruby-mode-hook)

;; Yaml mode
(add-to-path 'packages/yaml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

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

(add-to-path 'packages/markdown)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(setq markdown-command "Markdown.pl")

;;;; CSS
(require 'css-mode)

;;;; SCSS
(add-to-path 'packages/scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;;;; JavaScript
(add-to-path 'packages/js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Coffee mode
(add-to-path 'packages/coffee-mode)
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
	  '(lambda() (coffee-custom)))

(provide 'ezo-ruby)
