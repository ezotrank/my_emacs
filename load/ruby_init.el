;; Comment this, coz with this don't work feature-mode
(require 'rails)
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '("\\.rb$" . ruby-mode) auto-mode-alist))

;; (require 'ruby-electric)
;; (require 'snippet)
;; (require 'find-recursive)
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

(require 'rhtml-mode)
(autoload 'rhtml-mode "rhtml-mode" "Major mode for editing rails html." t)
(setq auto-mode-alist  (cons '("\\.erb$" . rhtml-mode) auto-mode-alist))

;; Rspec
(require 'rspec-mode)

;; Cucumber
(require 'feature-mode)
(autoload 'ruby-mode "feature-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '("\\.feature$" . feature-mode) auto-mode-alist))

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
