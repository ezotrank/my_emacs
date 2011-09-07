;; provide a useful error trace if loading this .emacs fails
;; (setq debug-on-error t)

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
(add-to-path 'packages/themes)
(add-to-path 'packages/magit)
(add-to-path 'packages/ruby-mode)
;; (add-to-path 'packages/yasnippet)

(load-init
  '(general    
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
    ezo))
;; Non use inits
;; rinari 
;; rhtml 
;; aspell
;; cedet
;; yasnippet ;; nice template system
;; mutt ;; for mutt-mode
;; haml ;; for haml-mode
;; nginx
;; coffee
;; scss
;; lua ;; for lua-mode


;; For server mode
(server-start)
