(use-package ghc
  :ensure t
  :commands (ghc-init ghc-debug)
  )

(use-package haskell-mode
  :ensure t
  :init
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))


(use-package shm
  :ensure t
  :commands (structured-haskell-mode)
  :init
  (add-hook 'haskell-mode-hook 'structured-haskell-mode))


(provide 'haskell-init)
