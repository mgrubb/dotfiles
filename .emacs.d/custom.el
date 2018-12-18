(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Org.org")))
 '(package-selected-packages
   (quote
    (rubocop company-lua lua-mode evil-matchit-mode evil-matchit toml-mode rust-mode coffee-mode ox-clip markdown-mode magit go-mode slime slime-company company-php php+-mode dockerfile-mode org-bullets evil-org org-evil evil-surround ac-cider ac-emmet ac-html ac-html-bootstrap ac-html-csswatcher aggressive-indent bug-hunter c-eldoc cider clojure-mode cmake-font-lock cmake-ide cmake-mode cmake-project column-marker company-c-headers company-mode dash-at-point dracula-theme el-get elm-mode emmet-mode ess evil evil-leader evil-magit evil-paredit exec-path-from-shell flymake-haskell-multi geeknote ghc go-eldoc graphviz-dot-mode haskell-mode help+ help-fns+ help-mode+ jade js2-mode linum-relative magit-gh-pulls magit-gitflow markdown-mode+ minimap omnisharp org paredit powerline-evil rainbow-delimiters scala-mode shm simpleclip sly-macrostep sly-quicklisp sly-repl-ansi-color tagedit telephone-line use-package web-mode which-key xkcd yaml-mode ztree)))
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail))))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:inherit (hl-line default) :foreground "#86DC2F" :inverse-video nil :underline t :weight extra-bold)))))
