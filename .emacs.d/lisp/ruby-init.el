(use-package rubocop
  :ensure t
  :commands (rubocop-check-project)
  :init
  (customize-set-variable 'rubocop-check-command "chef exec cookstyle --format emacs")
  (customize-set-variable 'rubocop-autocorrect-command "chef exec cookstyle -a --format emacs")
  :config
  (defun rubocop-ensure-installed ()
    "Override installation check"
    t))

(provide 'ruby-init)
