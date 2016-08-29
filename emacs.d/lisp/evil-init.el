(defun evil-fix-star-register
    (args)
  (let ((register (car args)))
    (if (= register ?*)
        (progn (setcar args ?+)
               args)
      args)))

(defun mg/move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location"
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

(defun mg/kill-after-quit
    (args)
  (kill-buffer))

(use-package evil
  :demand t
  :ensure t
  :init
  (setq-default evil-shift-width 2)
  (setq-default evil-auto-indent t)
  (setq evil-repeat-move-cursor t)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-want-C-u-scroll t)
  :config
  (evil-set-initial-state 'cider-repl-mode 'insert)
  (evil-set-initial-state 'ibuffer-mode 'normal)
  (evil-set-initial-state 'sly-db-mode 'emacs)
  (advice-add 'evil-get-register :filter-args #'evil-fix-star-register)
  ;; (advice-add 'evil-quit :before #'mg/kill-after-quit)
  (mg/move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
  (mg/move-key evil-motion-state-map evil-normal-state-map " ")
  (evil-mode 1)
  )

(use-package evil-leader
  :demand t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key "xk" 'kill-buffer))

(provide 'evil-init)
