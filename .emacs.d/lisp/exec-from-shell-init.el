(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

(provide 'exec-from-shell-init)
