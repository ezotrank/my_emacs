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
(add-to-list 'auto-mode-alist '("\\.pill$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; Jump. Need for inf-ruby
(add-to-path 'git-modules/jump)

;; Inf-ruby. Need for rinari
(add-to-path 'git-modules/inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))

;; Rinari
(add-to-path 'git-modules/rinari)
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

;; (defun rails-build-ctags ()
;;   "Build ctags for rails project"
;;   (interactive nil)
;;   (save-window-excursion
;;     (async-shell-command "ctags -a -e -f TAGS --tag-relative -R app lib vendor config ~/.rbenv/versions/1.9.3-p392-railsexpress/gemsets/aviasales/gems"))
;;   )

;; Ext sets
;; Disable insert -*- condig: utf-8 -*-
(setq ruby-insert-encoding-magic-comment nil)

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

;; Load HAML mode
(add-to-path 'git-modules/haml-mode)
(require 'haml-mode)
(add-hook 'haml-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (define-key haml-mode-map "\C-m" 'newline-and-indent)
	     ;; (prelude-turn-on-whitespace)
	     ))

;; Load Rspec mode
(add-to-path 'git-modules/rspec)
(require 'mode-compile)
(require 'rspec-mode)

;; Markdown mode
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

  ;; (prelude-turn-on-whitespace)
  )
(add-hook 'coffee-mode-hook 'coffee-custom)

(provide 'ezo-ruby)
