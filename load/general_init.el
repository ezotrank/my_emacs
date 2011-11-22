;; Don't need in console version
(tool-bar-mode -1)           ;; Disable up toolbar
(scroll-bar-mode -1)         ;; Disable vertical scroll bar
(menu-bar-mode -1)           ;; Disable menu bar

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling, emacs work slowly
;; (setq scroll-margin 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Ask questions with short answers
(fset 'yes-or-no-p 'y-or-n-p)

;; custom Emacs 24 color themes support
(add-to-list 'custom-theme-load-path (concat prelude-dir "themes/"))
(load-theme 'zenburn t)

;to highlight ( and )
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; Set a font 
(setq default-frame-alist '((font-backend . "xft")
                            (font . "Inconsolata-11")
                            (left-fringe . -1)
                            (right-fringe . -1)
                            ))

;Don't notify to kill buffer
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; highlight marked text
(transient-mark-mode t)

;; Resize windows
(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key [C-M-down] 'win-resize-minimize-vert)
(global-set-key [C-M-up] 'win-resize-enlarge-vert)
(global-set-key [C-M-left] 'win-resize-minimize-horiz)
(global-set-key [C-M-right] 'win-resize-enlarge-horiz)
(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-left] 'win-resize-enlarge-vert)
(global-set-key [C-M-right] 'win-resize-minimize-vert)


(global-set-key (kbd "M-g") 'goto-line)
;; (global-set-key (kbd "M-?") 'help-command)
;; (global-set-key (kbd "M-1") 'delete-other-windows)
;; (global-set-key (kbd "M-2") 'split-window-vertically)
;; (global-set-key (kbd "M-3") 'split-window-horizontally)
;; (global-set-key (kbd "M-0") 'delete-window)
;; (global-set-key (kbd "M-p") 'ecb-toggle-ecb-windows)

;; browse
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; this is also of interest, it auto-magically does a "chmod u+x"
;; when you save a script file (starting with "#!")
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; update timestamp
(add-hook 'before-save-hook 'time-stamp)

;; don't echo passwords when communicating with interactive programs
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)


;; real Emacs hackers don't use the arrow keys
(global-set-key (kbd "<up>") (lambda ()
                               (interactive)
                               (message "Arrow key navigation is disabled. Use C-p instead.")))
(global-set-key (kbd "<down>") (lambda ()
                                 (interactive)
                                 (message "Arrow key navigation is disabled. Use C-n instead.")))
(global-set-key (kbd "<left>") (lambda ()
                                 (interactive)
                                 (message "Arrow key navigation is disabled. Use C-b instead.")))
(global-set-key (kbd "<right>") (lambda ()
                                  (interactive)
                                  (message "Arrow key navigation is disabled. Use C-f instead.")))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))
;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;; saveplace remembers your location in a file when saving files
(setq save-place-file (concat user-emacs-directory "saveplace"))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; savehist keeps track of some history
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat user-emacs-directory "savehist"))
(savehist-mode t)

;; save recent files
(setq recentf-save-file (concat user-emacs-directory "recentf")
      recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode t)

;; time-stamps
;; when there's "Time-stamp: <>" in the first 10 lines of the file
(setq time-stamp-active t
      ;; check first 10 buffer lines for Time-stamp: <>
      time-stamp-line-limit 10
      time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving


;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings 'super)

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; bookmarks
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")
      bookmark-save-flag 1)

(defun prelude-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun prelude-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun prelude-turn-on-whitespace ()
  (whitespace-mode +1))

(defun prelude-turn-off-whitespace ()
  (whitespace-mode -1))

(defun prelude-turn-on-abbrev ()
  (abbrev-mode +1))

(defun prelude-coding-hook ()
  "Default coding hook, useful with any programming language."
  (flyspell-prog-mode)
  (prelude-local-comment-auto-fill)
  (prelude-turn-on-whitespace)
  (prelude-turn-on-abbrev)
  (prelude-add-watchwords))
