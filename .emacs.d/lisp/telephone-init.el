(use-package telephone-line
  :ensure t
  :demand t
  :init
  (setq telephone-line-evil-use-short-tag 1)
  :config
  (telephone-line-mode 1))

(provide 'telephone-init)
