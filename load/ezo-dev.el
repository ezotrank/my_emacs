;; Gist
(require 'gist)
(setq gist-use-curl t)
(setq gist-view-gist t)

;; Autocomplete
(add-to-path 'git-modules/auto-complete)
(add-to-path 'git-modules/popup)
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/git-modules/auto-complete/dict")
(ac-config-default)
(setq ac-menu-height 10)
(global-auto-complete-mode t)

(setq ac-auto-show-menu nil)
(setq ac-auto-show-menu 10)

;; Linum
(require 'linum+)
(setq linum-format "%d ")

;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)
;; auto-completion in minibuffer
(icomplete-mode +1)
(set-default 'imenu-auto-rescan t)

;; Magit
(add-to-path 'git-modules/magit)
(require 'magit)

;; Edit Shell scripts
(add-to-list 'auto-mode-alist '("\\.sh$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))

;; Eshell
(setq
 eshell-cmpl-cycle-completions nil
 eshell-buffer-shorthand t
 eshell-output-filter-functions '(eshell-handle-control-codes eshell-watch-for-password-prompt eshell-postoutput-scroll-to-bottom)
 eshell-scroll-show-maximum-output t
 eshell-scroll-to-bottom-on-output nil
 eshell-scroll-to-bottom-on-input 'this
 )

;; scroll to bottom for eshell

(eval-after-load "eshell"
  '(progn
     (defun eshell-scroll-to-bottom (window display-start)
       (if (and window (window-live-p window))
	   (let ((resize-mini-windows nil))
	     (save-selected-window
	       (select-window window)
	       (save-restriction
		 (widen)
		 (when (> (point) eshell-last-output-start) ; we're editing a line. Scroll.
		   (save-excursion
		     (recenter -1)
		     (sit-for 0))))))))

     (defun eshell-add-scroll-to-bottom ()
       (interactive)
       (add-hook 'window-scroll-functions 'eshell-scroll-to-bottom nil t))

     (add-hook 'eshell-mode-hook 'eshell-add-scroll-to-bottom)

     (defun eshell/e (&rest args)
       (if (null args)
	   (bury-buffer)
	 (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

     (defsubst eshell/ls (&rest args)
       "An alias version of `eshell-do-ls'."
       (let ((insert-func 'eshell-buffered-print)
	     (error-func 'eshell-error)
	     (flush-func 'eshell-flush)
	     (args-plus (append
			 (cond ((not (eq (car (aref eshell-current-handles 1)) t))
				(list "-1")))
			 args)))
	 (eshell-do-ls args-plus)))

     (defun eshell-maybe-bol ()
       (interactive)
       (let ((p (point)))
	 (eshell-bol)
	 (if (= p (point))
	     (beginning-of-line))))

     ;; eshell-mode-map is buffer-local
     (add-hook 'eshell-mode-hook (lambda ()
				   (define-key eshell-mode-map (kbd "C-a") 'eshell-maybe-bol)
				   (define-key eshell-mode-map (kbd "<home>") 'eshell-maybe-bol)))))


;;;; Modeline
(require 'modeline-posn)
(column-number-mode 1)
(size-indication-mode 1)

;;;; Buffplus
(require 'buff-menu+)

;;;; Yasnippets
(add-to-path 'git-modules/yasnippet)
(require 'yasnippet)
(yas/global-mode 1)

;; Settings for yasnippet.
(defun yasnippet-settings ()
  "settings for `yasnippet'."

  (setq yas/snippet-dirs (concat "~/.emacs.d/" "snippets"))
  (yas/load-directory yas/snippet-dirs)

  ;; Reload snippet after snippet buffer save.
  (defun yasnippet-reload-after-save ()
    (let* ((bfn (expand-file-name (buffer-file-name)))
           (root (expand-file-name yas/snippet-dirs)))
      (when (string-match (concat "^" root) bfn)
        (yas/load-snippet-buffer))))
  (add-hook 'after-save-hook 'yasnippet-reload-after-save)
)

(eval-after-load "yasnippet"
  `(yasnippet-settings))


(defun prelude-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|OPTIMIZE\\):"
	  1 font-lock-warning-face t))))

(defun prelude-coding-hook ()
  "Default coding hook, useful with any programming language."
  (prelude-turn-on-abbrev)
  (prelude-turn-on-whitespace)
  (prelude-add-watchwords))

(defun comment-or-uncomment-current-line-or-region ()
  "Comments or uncomments current current line or whole lines in region."
  (interactive)
  (save-excursion
    (let (min max)
      (if (region-active-p)
	  (setq min (region-beginning) max (region-end))
	(setq min (point) max (point)))
      (comment-or-uncomment-region
       (progn (goto-char min) (line-beginning-position))
       (progn (goto-char max) (line-end-position))))))

;; delete the selection with a keypress
(delete-selection-mode t)

;;;; Else

;; this is also of interest, it auto-magically does a "chmod u+x"
;; when you save a script file (starting with "#!")
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Nav
(add-to-path 'packages/emacs-nav)
(require 'nav)
(nav-disable-overeager-window-splitting)

(provide 'ezo-dev)
