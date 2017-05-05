(use-package org
  :pin org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-directory "~/Documents/Notes")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-tag-alist '(("worklog" . ?l)))
  (setq org-agenda-files '("~/Documents/Notes"))
  (setq default-major-mode 'org-mode))

(use-package org-evil
  :ensure t)

(provide 'org-init)
