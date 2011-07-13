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
(add-to-path 'packages/themes)
(add-to-path 'packages/magit)
(add-to-path 'packages/ruby-mode)
(add-to-path 'packages/yasnippet)

(load-init
  '(general 
    linum+ 
    ido 
    magit 
    rinari 
    ruby 
    rhtml 
    eshell 
    org 
    modeline 
    yasnippet 
    lua 
    mutt 
    haml
    yaml
    autocomplate
    aspell
    cedet
    ecb
    nginx
    buffplus
    ezo))

;; For server mode
(server-start)
