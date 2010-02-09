(require 'rails)
(require 'ruby-electric)
(require 'snippet)
(require 'find-recursive)
(require 'rinari)
(setq rinari-tags-file-name "TAGS")
(require 'rhtml-mode)

(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".erb$" . rhtml-mode) auto-mode-alist))

;; Rspec
(require 'rspec-mode)

;; Cucumber
(require 'feature-mode)

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
  (shell-command "echo 1 > /home/ezo/dev/pronix_project_1/hfilehosting/tmp/restart.txt" t)
  )
(global-set-key (kbd "C-x r n") 'nginx-passenger-restart)
