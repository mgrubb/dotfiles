;; Configure Lispy modes (see also paredit-init.el)
(defvar lispy-hooks
  '(emacs-lisp-mode-hook
    ielm-mode-hook
    lisp-mode-hook
    scheme-mode-hook
    lisp-interaction-mode-hook
    eval-expression-minibuffer-setup-hook))

;; enable lispy features
(mapc (lambda (hook)
	(add-hook hook #'enable-paredit-mode)
	(add-hook hook #'evil-paredit-mode)
        (add-hook hook #'eldoc-mode))
      lispy-hooks)

(add-hook 'eldoc-mode-hook (lambda () (diminish 'eldoc-mode)))

(provide 'lispy-init)
