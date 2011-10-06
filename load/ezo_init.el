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

;; Here's a handy function that kills the current buffer and removes the file it is connected to.
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
;; (global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)
