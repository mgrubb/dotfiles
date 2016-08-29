(use-package telephone-line
  :ensure t
  :demand t
  :init
  (setq telephone-line-evil-use-short-tag 1)
  :config
  (setq telephone-line-lhs
	'((evil . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil . (telephone-line-minor-mode-segment
		  telephone-line-buffer-segment))))

  (setq telephone-line-rhs
	'((nil . (telephone-line-misc-info-segment))
	  (accent . (telephone-line-major-mode-segment))
	  (evil . (telephone-line-airline-position-segment))))

  (telephone-line-mode 1))

;; (use-package powerline
;;   :ensure t)
(provide 'telephone-init)
