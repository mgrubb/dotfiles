(use-package clojure-mode
  :ensure t
  :commands (clojure-mode)
  :mode (("\\.clj[cx]?\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode))
  :init
  (setq clojure-align-forms-automatically 1)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'evil-paredit-mode)
  :config
  (define-clojure-indent
    (defui '(1 :form :form (1))))
  (use-package cider
    :ensure t
    :commands (cider-mode cider-jack-in)
    :diminish "CDR"
    :init
    (setq cider-prompt-for-symbol nil)
    (setq nrepl-log-messages nil)
    :config
    (add-hook 'cider-mode-hook #'eldoc-mode)))

(provide 'clojure-init)
