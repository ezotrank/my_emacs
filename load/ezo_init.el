;; setting username, email address and other stuff
(setq user-full-name "Maxim Kremenev")
(setq user-mail-address "ezotrank@gmail.com")

(defun autocompile ()
  "Compile itself if this is config file"
  (interactive)
  (if (or
       (string-match ".emacs.d/load/[a-z]+_init.el$" (buffer-file-name))
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

(defun package_compile()
  (setq path-to-package-dir "~/.emacs/packages")
  "Compile all package files."
  (interactive nil)
  (shell-command
   (format "emacs -L . -batch -f batch-byte-compile *.el" path-to-package-dir)
   )
)

(defun restart-snippets()
  "Restart Emacs snippets"
  (interactive)
  (load-file "~/.emacs.d/load/yasnippet_init.el")
)

;; (add-hook 'after-save-hook 'autocompile)

;; Kill emacs daemon but save session
(defun my-kill-emacs ()
  (interactive)
  (save-some-buffers)
  (desktop-save-in-desktop-dir)
  (kill-emacs))
(global-set-key (kbd "C-x c") 'my-kill-emacs)

(defun delete-file-and-buffer ()
  "Kills the current buffer and deletes the file it is visiting"
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (delete-file filename)
      (message "Deleted file %s" filename)))
  (kill-buffer))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
