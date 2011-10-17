;; Emacs Package System

;; ELPA repositories
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ))
;; Adapt to suit you needs
;; see http://tromey.com/elpa/news.html for available packages
(defvar starter-kit-packages (list 'org
                                   'ruby-mode
                                   'ruby-electric
                                   'ruby-end
                                   'haml-mode
                                   'rspec-mode
                                   'ecb-stap
                                   'magit)
  "Libraries that should be installed by default.")

(defun starter-kit-elpa-install ()
  "Install all starter-kit packages that aren't installed."
  (interactive)
  (dolist (package starter-kit-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))
