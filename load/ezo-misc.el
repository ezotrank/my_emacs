;;;; Lua
(add-to-path 'git-modules/lua-mode)
(require 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;;; Nginx
(add-to-path 'git-modules/nginx-mode)
(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("nginx.conf$" . nginx-mode))

(provide 'ezo-misc)
