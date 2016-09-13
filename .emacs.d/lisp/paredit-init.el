;; Automatically load paredit when editing a LISP file
;; More at http://www.emacswiki.org/emacs/ParEdit
(use-package evil-paredit
  :ensure t
  :commands (evil-paredit-mode))

(use-package paredit
  :ensure t
  :commands (enable-paredit-mode paredit-mode)
  :diminish (paredit-mode . ")")
  :config
  (evil-leader/set-key-for-mode 'paredit-mode
    "W" 'paredit-wrap-round
    "(" 'paredit-wrap-round
    "w[" 'paredit-wrap-square
    "w{" 'paredit-wrap-curly
    "w\"" 'paredit-meta-doublequote
    "s" 'paredit-splice-sexp
    ">" 'paredit-forward-slurp-sexp
    "<" 'paredit-backward-slurp-sexp
    "j" 'paredit-join-sexps))

(provide 'paredit-init)
