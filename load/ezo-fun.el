;; setting username, email address and other stuff
(setq user-full-name "Maxim Kremenev")
(setq user-mail-address "ezotrank@gmail.com")

(defun restart-snippets()
  "Restart Emacs snippets"
  (interactive)
  (load-file "~/.emacs.d/load/yasnippet_init.el")
  )

;; Kill emacs daemon but save session
(defun my-kill-emacs ()
  (interactive)
  (save-some-buffers)
  (desktop-save-in-desktop-dir)
  (kill-emacs))
(global-set-key (kbd "C-x c") 'my-kill-emacs)

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun prelude-open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))

(defun prelude-move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(global-set-key [(control shift up)] 'prelude-move-line-up)

(defun prelude-move-line-down ()
  "Move down the current line."
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key [(control shift down)] 'prelude-move-line-down)

(defun reload-current-config()
  "Reload current config file"
  (interactive)
  (load-file (buffer-file-name))
  )

(defun open-developer-screen ()
  "Open the developer screen"
  (interactive nil)
  (shell-command "tmux")
  ;; (if (file-exists-p ".screenrc")
  ;;     (shell-command "urxvtc -name EmacsDevScreen +sb -e screen -S dev -c .screenrc")
  ;;   (shell-command "urxvtc -name EmacsDevScreen +sb -e screen -S dev")
  ;;     )
  )

(defun open-urxvtc ()
  "Open urxvtc terminal in current direcotry"
  (interactive nil)
  (shell-command "urxvtc")
  )

(provide 'ezo-fun)
