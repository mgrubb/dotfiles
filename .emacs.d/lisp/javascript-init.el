(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package jade
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'jade-interaction-mode))

(provide 'javascript-init)
