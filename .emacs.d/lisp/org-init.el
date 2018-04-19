(use-package org
  :pin org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-directory "~/Documents/Notes")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("t" "Technical Notes")
          ("tg" "General" entry (file (concat org-directory "/tn-general.org"))
           "* %?\n    %i\n%a\n%t")
          ("tu" "Unix" entry (file (concat org-directory "/tn-unix.org"))
           "* %? %^g\n    %i")))
  (setq org-tag-alist '(("worklog" . ?l)))
  (setq org-agenda-files '("~/Documents/Notes"))
  (setq default-major-mode 'org-mode)
  (setq org-html-validation-link nil))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'org-init)
