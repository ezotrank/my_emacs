;;;; Gist
(add-to-path 'packages/gist)
(require 'gist)
;; (setq gist-view-gist t)

;;;; Autocomplete
(add-to-path 'packages/auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-path 'packages/auto-complete/dict)
(ac-config-default)
(setq ac-auto-show-menu nil)
(global-auto-complete-mode t)

;;;; Linum
(require 'linum+)
(setq linum-format "%d ")
(add-hook 'emacs-lisp-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'yaml-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'html-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'ruby-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'feature-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'rspec-mode-hook
     '(lambda() (linum-mode 1)))
(add-hook 'haml-mode-hook
     '(lambda() (linum-mode 1)))

;;;; IDO
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

;;;; Magit
(add-to-path 'packages/magit)
(require 'magit)

;;;; Eshell
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
(add-to-path 'packages/yasnippet)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet/snippets")

;;;; Aspell
;; flyspell-mode does spell-checking on the fly as you type
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(defun prelude-turn-on-flyspell ()
  "Force flyspell-mode on using a positive argument.  For use in hooks."
  (interactive)
  (flyspell-mode +1))


;;;; Ecb
(setq stack-trace-on-error nil)
(add-to-list 'load-path "~/.emacs.d/elpa/ecb_snap-20110605")
(require 'ecb)
(ecb-byte-compile)
(setq imenu-auto-rescan 1)
(custom-set-variables
 '(ecb-tip-of-the-day nil)
 '(ecb-options-version "2.40")
 '(ecb-layout-name "left14")
  '(ecb-layout-window-sizes (quote (("left14" (ecb-directories-buffer-name 0.1893491124260355 . 0.37209302325581395) (ecb-history-buffer-name 0.1893491124260355 . 0.6046511627906976)))))
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(inhibit-startup-screen t)
)

;;;; Else

;; this is also of interest, it auto-magically does a "chmod u+x"
;; when you save a script file (starting with "#!")
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defun prelude-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|OPTIMIZE\\):"
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
  (prelude-local-comment-auto-fill)
  (prelude-turn-on-abbrev)
  ;; (flyspell-prog-mode)
  ;; (prelude-turn-on-whitespace)
  (prelude-add-watchwords))


(provide 'ezo-dev)
