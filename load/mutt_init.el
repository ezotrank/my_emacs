(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;; (defun my-mail-mode-hook ()
;;   (auto-fill-mode 1)
;;   (abbrev-mode 1))
;; (add-hook 'mail-mode-hook 'my-mail-mode-hook)
;; (add-hook 'mail-mode-hook 'turn-on-auto-fill)


(add-to-list 'auto-mode-alist '(".*mutt.*" . message-mode))                                                                   
(setq mail-header-separator "")                                                                                               
(add-hook 'message-mode-hook 'auto-fill-mode)                                                                                 
(define-key message-mode-map (kbd "C-c C-c")  '(lambda ()                                                                     
                                                 "save and exit quickly"                                                      
                                                 (interactive)                                                                
                                                 (save-buffer)                                                                
                                                 (server-edit)))     

(defun axels-mail-mode-hook ()
  (turn-on-auto-fill) ;;; Auto-Fill is necessary for mails
  (turn-on-font-lock) ;;; Font-Lock is always cool *g*
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*") 
                      ;;; Kills quoted sigs.
  (not-modified)      ;;; We haven't changed the buffer, haven't we? *g*
  (mail-text)         ;;; Jumps to the beginning of the mail text
  (setq make-backup-files nil)
                      ;;; No backups necessary.
)
(or (assoc "mutt-" auto-mode-alist) 
      (setq auto-mode-alist (cons '("mutt-" . mail-mode) auto-mode-alist)))
(add-hook 'mail-mode-hook 'axels-mail-mode-hook)
