(use-package c-eldoc
  :commands c-turn-on-eldoc-mode
  :init
  (setq c-eldoc-includes "-I./ -I../ ")
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode))

(use-package cmake-mode
  :commands cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  :config
  (use-package cmake-font-lock
    :init
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)))

(provide 'c-init)

