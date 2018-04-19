(use-package enh-ruby-mode
  :ensure t
  :mode (("\\.rb\\'" . enh-ruby-mode)
         ("\\.rake\\'" . enh-ruby-mode)
         ("Rakefile\\'" . enh-ruby-mode)
         ("\\.gemspec\\'" . enh-ruby-mode)
         ("\\.ru\\'" . enh-ruby-mode)
         ("Gemfile\\'" . enh-ruby-mode))
  :init
  (setq enh-ruby-program "/usr/local/var/rbenv/shims/ruby")
  (setq enh-ruby-bounce-deep-indent t)
  (setq enh-ruby-hanging-brace-indent-level 2)
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))

(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/")))
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

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
