(autoload 'forth-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode)
                            auto-mode-alist))
(autoload 'forth-block-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode)
                            auto-mode-alist))
(add-hook 'forth-mode-hook (function (lambda ()
                                       ;; Customize variables here:
                                       (setq forth-indent-level 4)
                                       (setq forth-minor-indent-level 2)
                                       (setq forth-hilight-level 3)
                                       )))

(provide 'forth-init)
