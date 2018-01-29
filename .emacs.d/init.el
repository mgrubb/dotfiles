
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold 100000000)
(setq initial-scratch-message "")

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(load "packages-init.el")

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file :noerror)

(load "utils.el")
(load "exec-from-shell-init.el")
(load "org-init.el")
(load "ui-init.el")
(load "company-init.el")
(load "edit-init.el")
(load "telephone-init.el")
(load "web-init.el")
(load "paredit-init.el")
(load "lispy-init.el")
(load "clojure-init.el")
(load "c-init.el")
(load "markdown-init.el")
(load "magit-init.el")
(load "help-init.el")
(load "elm-init.el")
(load "haskell-init.el")
(load "javascript-init.el")
(load "evil-init.el")
