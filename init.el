;; provide a useful error trace if loading this .emacs fails
(setq debug-on-error nil)

(when (file-exists-p "/usr/share/emacs/site-lisp/site-gentoo.el")
  (require 'site-gentoo)
  )

(defun add-to-path (dir)
  (add-to-list 'load-path
               (format "~/.emacs.d/%s" dir)))

(add-to-path 'packages)

(defvar prelude-dir (file-name-directory load-file-name))
(defvar prelude-modules-dir (concat prelude-dir "load/"))

(add-to-list 'load-path prelude-modules-dir)
(require 'ezo-main)
(require 'ezo-dev)
(require 'ezo-ruby)
(require 'ezo-org)
(require 'ezo-fun)
(require 'ezo-misc)
(require 'ezo-keybind)

;; For server mode
(server-start)
