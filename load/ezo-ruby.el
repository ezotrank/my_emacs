(require 'ruby-mode)

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
(add-to-path 'git-modules/ruby-electric)
(require 'ruby-electric)

;; For insert end
(add-to-path 'git-modules/ruby-end)
(require 'ruby-end)
(require 'ruby-block)

(defun ruby-coding-hook ()
  (prelude-turn-on-abbrev)
  (prelude-add-watchwords)
  )

(add-hook 'ruby-mode-hook 'ruby-coding-hook)

;; Yaml mode
(add-to-path 'git-modules/yaml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Load Rhtml mode
(add-to-path 'git-modules/rhtml-mode)
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
(add-to-path 'git-modules/cucumber)
(require 'feature-mode)
(setq feature-default-language "en")
(setq feature-default-i18n-file "~/.emacs.d/packages/cucumber/i18n.yml")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; Load HAML mode
(add-to-path 'git-modules/haml-mode)
(require 'haml-mode)
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (define-key haml-mode-map "\C-m" 'newline-and-indent)
	     (prelude-turn-on-whitespace)
	     ))

(require 'slim-mode)

;; Load Rspec mode
(add-to-path 'git-modules/rspec)
(require 'mode-compile)
(require 'rspec-mode)

(add-to-path 'git-modules/markdown)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(setq markdown-command "Markdown.pl")

;;;; CSS
(require 'css-mode)

;;;; SCSS
(add-to-path 'git-modules/scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;;;; JavaScript
(add-to-path 'git-modules/js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Coffee mode
(add-to-path 'git-modules/coffee-mode)
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"

    ;; CoffeeScript uses two spaces.
  (set (make-local-variable 'tab-width) 2)

  ;; If you don't have js2-mode
  (setq coffee-js-mode 'javascript-mode)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; electric-indent doesn't play nice with coffee-mode's "smart"
  ;; indent
  (electric-indent-mode -1)

  ;; Emacs key binding
  ;; (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Riding edge.
  ;; (setq coffee-command "~/dev/coffee")

  ;; Compile '.coffee' files on every save
  ;; (and (file-exists-p (buffer-file-name))
  ;;      (file-exists-p (coffee-compiled-file-name))
  ;;      (coffee-cos-mode t)))

  (prelude-turn-on-whitespace)
  )
(add-hook 'coffee-mode-hook 'coffee-custom)


(provide 'ezo-ruby)
