(use-package general
  :ensure t
  :commands (evil-mode)
  :config
  (general-define-key :prefix nil
                      :states '(normal)
                      "j" 'evil-next-visual-line
                      "k" 'evil-previous-visual-line)

  (general-define-key :states '(normal)
                      "xk" 'kill-buffer)

  (general-define-key :prefix "g"
                      "j" 'evil-next-line
                      "k" 'evil-previous-line)

  (general-define-key :keymaps 'paredit-mode-map
                      :states '(emacs normal)
                      "W" 'paredit-wrap-round
                      "(" 'paredit-wrap-round
                      "w[" 'paredit-wrap-square
                      "w{" 'paredit-wrap-curly
                      "w\"" 'paredit-meta-doublequote
                      "s" 'paredit-splice-sexp
                      ">" 'paredit-forward-slurp-sexp
                      "<" 'paredit-backward-slurp-sexp
                      "j" 'paredit-join-sexps)
  :init
  (setq general-default-prefix ",")

  (setq general-default-keymaps '(evil-normal-state-map)))

