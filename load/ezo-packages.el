(require 'package)
(add-to-path 'git-modules/melpa)
(require 'melpa)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq url-http-attempt-keepalives nil)

(defvar prelude-packages
  '(gist ruby-mode)
  "A list of packages to ensure are installed at launch.")

(provide 'ezo-packages)
