;; Diminish mode
(use-package diminish
  :ensure t
  :demand t
  :config
  (add-hook 'undo-tree-mode-hook (lambda () (diminish 'undo-tree-mode)))
  (add-hook 'subword-mode-hook (lambda () (diminish 'subword-mode ","))))

;; Show keybinding hints
(use-package which-key
  :ensure t
  :demand t
  :diminish ""
  :config
  (which-key-mode))

;; Only ask for y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Get rid of the suspend button
(global-unset-key [C-z])

;; Don't show startup message
(setq inhibit-startup-message t)

(menu-bar-mode 1)
(tool-bar-mode -1)

;; Set Default Frame size
(add-to-list 'default-frame-alist '(width . 170) '(height . 50))

;; Enable line numbers
(global-linum-mode)

;; Turn off native scrollbars
(scroll-bar-mode -1)

;; Turn off blinking cursor
(blink-cursor-mode 0)

;; Show full pathname in title
(setq-default frame-title-format "%b (%f)")

;; Don't show the font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Set font
;;(set-face-attribute 'default nil :family "monofur for PowerLine"
(set-face-attribute 'default nil :family "MonofurForPowerLine Nerd Font"
                    :weight 'normal
                    :width 'normal
                    :slant 'normal
                    :height 170)

(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; Load pretty colors
(load-theme 'monokai)

(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs)))))

(add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

(when (display-graphic-p)
  (ns-raise-emacs))

(provide 'ui-init)
