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


(require 'feature-mode)
(setq feature-default-language "en")
(setq feature-default-i18n-file "~/.emacs.d/own_snippets/i18n.yml")
(setq feature-default-language "en")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))


;; ;; CTAGS
;; (setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
;; (defun create-tags (dir-name)
;;   "Create tags file."
;;   (interactive "DDirectory: ")
;;   (shell-command
;;    (format "%s -f %s/TAGS --Ruby-kinds=+ -e -R %s" path-to-ctags dir-name dir-name))
;;   )

;; (defun try-complete-abbrev (old)
;;   (if (expand-abbrev) t nil))

;; (setq hippie-expand-try-functions-list
;;       '(try-complete-abbrev
;;         try-complete-file-name
;;         try-expand-dabbrev))


;; (defun nginx-passenger-restart ()
;;   (interactive)
;;   (shell-command "echo 1 > /home/ezo/dev/pronix/multishop/tmp/restart.txt" t)
;;   )
;; (global-set-key (kbd "C-x r n") 'nginx-passenger-restart)
