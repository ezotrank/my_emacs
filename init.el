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
(defvar prelude-vendor-dir (concat prelude-dir "vendor/"))

(add-to-list 'load-path prelude-vendor-dir)
(add-to-list 'load-path prelude-modules-dir)
(require 'ezo-packages)
(require 'ezo-main)
(require 'ezo-dev)
(require 'ezo-ruby)
(require 'ezo-javascript)
(require 'ezo-php)
(require 'ezo-org)
(require 'ezo-misc)
(require 'ezo-keybind)

(unless (server-running-p) (server-start))
