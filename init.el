;; provide a useful error trace if loading this .emacs fails
(setq debug-on-error t)

(when (file-exists-p "/usr/share/emacs/site-lisp/site-gentoo.el")
  (require 'site-gentoo))

;; setting username, email address and other stuff
(setq user-full-name "Maxim Kremenev")
(setq user-mail-address "ezotrank@gmail.com")

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
(add-to-path 'packages/git-emacs)
(add-to-path 'packages/cedet)
(add-to-path 'packages/ecb)
(add-to-path 'packages/yasnippet)
(add-to-path 'packages/auto-complete)
(add-to-path 'packages/ruby-mode)
(add-to-path 'packages/rails-minor-mode)
(add-to-path 'packages/rhtml-minor-mode)
(add-to-path 'packages/rinari)
(add-to-path 'packages/rspec-mode)

(defun autocompile ()
  "Compile itself if this is config file"
  (interactive)
  (if (or
       (string-match ".emacs.d/load/[a-z]+_init.el$" (buffer-file-name))
       ;; (string-match ".emacs.d/init.el$" (buffer-file-name))
       )
      (byte-compile-file (buffer-file-name))))

(defun config_compile()
  (setq path-to-config-dir "~/.emacs/load")
  "Compile all config files."
  (interactive nil)
  (shell-command
   (format "emacs -L . -batch -f batch-byte-compile *.el" path-to-config-dir)
   )
)

;; (add-hook 'after-save-hook 'autocompile)

(load-init
  '(general cedet ruby yaml linummode eshell iswitchb ido pastemacs git tramp 
            lua pastetext org ecb css javascript yasnippet autocomplate))

;; Start daemon
(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
