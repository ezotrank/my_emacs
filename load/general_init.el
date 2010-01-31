;; don't ask, just do it!
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'overwrite-mode 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq
 inhibit-startup-message t           ;; don't show annoing startup msg
 make-backup-files nil               ;; NO annoing backups
 vc-follow-symlinks t                ;; follow symlinks and don't ask
 echo-keystrokes 0.01                ;; see what you type
 comint-completion-addsuffix t       ;; Insert space/slash after completion
 kill-whole-line t                   ;; delete line in one stage
 default-major-mode 'text-mode       ;; default mode
 delete-key-deletes-forward t        ;; meaning are the same as the name :)
 next-line-add-newlines nil          ;; don't add new lines when scrolling down
 require-final-newline t             ;; make sure file ends with NEWLINE
 mode-require-final-newline t        ;; same as above, set more generally
 delete-old-versions t               ;; delete excess backup versions
 default-tab-width 4
 mouse-yank-at-point t               ;; paste at cursor, NOT at mouse pointer position
 apropos-do-all t                    ;; apropos works better but slower
 display-time-24hr-format t
 display-time-day-and-date t
 calendar-date-style 'european
 calendar-week-start-day 1
 auto-save-interval 128              ;; autosave every 512 keyboard inputs
 auto-save-list-file-prefix nil
 cursor-in-non-selected-windows nil
 dired-recursive-copies 'top
 dired-recursive-deletes 'top
 safe-local-variable-values '((encoding . utf-8) (prompt-to-byte-compile))
 dabbrev-case-fold-search nil        ;; Case is significant for dabbrev
 split-width-threshold 200           ;; I don't like horizontal splitting
 kill-ring-max 2000                  ;; oh yes! long killring!
 search-highlight t                  ;; Highlight search object
 query-replace-highlight t           ;; Highlight query object
 mouse-sel-retain-highlight t        ;; Keep mouse high-lightening
 current-language-environment "English"
 require-final-newline t             ;; _always_ require final newline
 undo-limit 40000                    ;; Set undo limit
 )

(setq-default
 save-place t         ;; save position in files
 case-fold-search t   ;; case INsensitive search
 indent-tabs-mode nil ;; do not use tabs for indentation
 fill-column 80       ;; number of chars in line
 save-place t         ;; save position in files
)

;; Ask questions with short answers
(fset 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function (lambda () ())) ;; I hate beeps

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-subtle-hacker)


(tool-bar-mode nil)           ;; Disable up toolbar
(scroll-bar-mode nil)         ;; Disable vertical scroll bar
(menu-bar-mode nil)           ;; Disable menu bar

;to highlight ( and )
(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)

;Save emacs session when don't use session.el
(desktop-save-mode t)

;Don't notify to kill buffer
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; Time in statusbar
;; (setq display-time-interval 1)
;; (setq display-time-format "%H:%M:%S")
;; (display-time-mode)

;; highlight marked text
(transient-mark-mode t)

;; change backup behavior to save in a directory, not in a miscellany
;; of files all over the place
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control nil)

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
(global-set-key (kbd "M-?") 'help-command)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-p") 'ecb-toggle-ecb-windows)

;; browse
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-bin")

;; this is also of interest, it auto-magically does a "chmod u+x"
;; when you save a script file (starting with "#!")
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; update timestamp
(add-hook 'before-save-hook 'time-stamp)

;; don't echo passwords when communicating with interactive programs
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

