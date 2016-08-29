(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Org.org")))
 '(package-selected-packages
   (quote
    (js2-mode jade graphviz-dot-mode column-marker simpleclip ztree xkcd which-key web-mode use-package telephone-line tagedit sly-repl-ansi-color sly-quicklisp sly-macrostep rainbow-delimiters powerline-evil org minimap markdown-mode+ magit-gitflow magit-gh-pulls linum-relative help-mode+ help-fns+ help+ haskell-mode go-eldoc flymake-haskell-multi evil-paredit evil-magit evil-leader elm-mode el-get dracula-theme dash-at-point cmake-project cmake-ide cmake-font-lock c-eldoc bug-hunter aggressive-indent ac-html-csswatcher ac-html-bootstrap ac-html ac-emmet ac-cider)))
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
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
