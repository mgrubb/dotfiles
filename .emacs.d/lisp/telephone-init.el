(use-package telephone-line
  :ensure t
  :demand t
  :init
  (setq telephone-line-evil-use-short-tag 1)
  (setq telephone-line-rhs
        '((nil . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil . (telephone-line-airline-position-segment))))
  :config
  (require 'telephone-line-config)
  (telephone-line-evil-config)
  (telephone-line-mode 1))

(provide 'telephone-init)
