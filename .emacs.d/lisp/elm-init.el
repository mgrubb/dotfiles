(use-package elm-mode
  :ensure t
  :init
  (add-hook 'elm-mode-hook (lambda () (aggressive-indent-mode -1))))

(provide 'elm-init)
