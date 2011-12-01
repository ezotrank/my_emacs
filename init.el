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
(add-to-path 'packages/ecb-snap)
(add-to-path 'packages/magit)

(defvar prelude-dir (file-name-directory load-file-name))
(defvar ezo-elpa (concat prelude-dir "elpa/"))
(add-to-list 'load-path ezo-elpa)

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
   ezo))

;; Non use inits
;; rinari 
;; rhtml 
;; aspell
;; cedet
;; yasnippet ;; nice template system
;; mutt ;; for mutt-mode

;; nginx
;; coffee
;; scss
;; 
;; For server mode
(server-start)
