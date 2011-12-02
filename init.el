;; provide a useful error trace if loading this .emacs fails
(setq debug-on-error nil)

(when (file-exists-p "/usr/share/emacs/site-lisp/site-gentoo.el")
  (require 'site-gentoo))

(defun add-to-path (dir)
  (add-to-list 'load-path
               (format "~/.emacs.d/%s" dir)))

(defun load-init (modules)
  "Load initialization files"
  (mapc (lambda (name)
          (load (format "%s_init" name)))
        modules))

(add-to-path 'load)                     ; initialization
(add-to-path 'packages)                 ; additional packages

(defvar prelude-dir (file-name-directory load-file-name))

(load-init
 '(general
   keybindings
   elpa
   autocomplate
   linum+ ;; Line number
   ido 
   magit ;; nice git
   ruby ;; some special for ruby and rails
   eshell ;; nice shell 
   org ;; org-mode configure
   modeline 
   yaml ;; for yaml-mode
   ecb
   buffplus
   gist
   lua ;; for lua-mode
   yasnippet ;; nice template system
   aspell
   ezo))

;; For server mode
(server-start)
