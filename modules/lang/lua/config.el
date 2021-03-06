;;; lang/lua/config.el -*- lexical-binding: t; -*-

(after! lua-mode
  (add-hook 'lua-mode-hook #'flycheck-mode)

  (set! :lookup 'lua-mode :documentation 'lua-search-documentation)
  (set! :electric 'lua-mode :words '("else" "end"))
  (set! :repl 'lua-mode #'+lua/repl)
  (set! :company-backend 'lua-mode '(company-lua company-yasnippet))

  (def-menu! +lua/build-menu
    "Build/compilation commands for `lua-mode' buffers."
    '(("Run Love app" :exec +lua/run-love-game :when +lua-love-mode))
    :prompt "Build tasks: ")

  (map! :map lua-mode-map
        :localleader
        :n "b" #'+lua/build-menu))


(after! moonscript
  (defvaralias 'moonscript-indent-offset 'tab-width))


;;
;; Frameworks
;;

(def-project-mode! +lua-love-mode
  :modes (lua-mode markdown-mode json-mode)
  :files (and "main.lua" "conf.lua"))

