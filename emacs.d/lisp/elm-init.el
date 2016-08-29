(use-package elm-mode
  :init
  (add-hook 'elm-mode-hook (lambda () (aggressive-indent-mode -1))))
