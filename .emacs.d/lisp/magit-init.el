(use-package magit
  :commands magit-get-top-dir
  :config
  (use-package evil-magit)
  (use-package magit-gitflow
    :init
    (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))
  (use-package magit-gh-pulls
    :init
    (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)))

(provide 'magit-init)
