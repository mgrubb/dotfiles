;; (autoload 'web-mode "web-mode" "Webmode setup")
;; (autoload 'emmet-mode "emmet-mode" "Emmet setup")

(use-package web-mode
  :ensure t
  :commands (web-mode)
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css?\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 0))

(use-package emmet-mode
  :ensure t
  :diminish (emmet-mode . "E")
  :commands (emmet-mode)
  :init
  (mapc (lambda (hook) (add-hook hook 'emmet-mode)) '(web-mode-hook
                                                      sgml-mode-hook
                                                      css-mode-hook)))

(add-hook 'css-mode-hook #'aggressive-indent-mode)

