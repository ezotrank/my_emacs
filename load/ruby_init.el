;; Comment this, coz with this don't work feature-mode
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(require 'rails)
(require 'rhtml-mode)
(require 'rinari)
(setq rinari-tags-file-name "TAGS")
(require 'rspec-mode)
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; CTAGS
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS --Ruby-kinds=+ -e -R %s" path-to-ctags dir-name dir-name))
  )

(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))


(defun nginx-passenger-restart ()
  (interactive)
  (shell-command "echo 1 > /home/ezo/dev/pronix/multishop/tmp/restart.txt" t)
  )
(global-set-key (kbd "C-x r n") 'nginx-passenger-restart)
