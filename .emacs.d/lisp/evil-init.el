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

(defun mg/open-worklog ()
  (org-open-file-with-emacs "~/Documents/Notes/Worklog.org"))

(use-package evil-leader
  :demand t
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "xk" 'kill-buffer
    "gj" 'evil-next-visual-line
    "gk" 'evil-previous-visual-line
    "W" 'paredit-wrap-round
    "(" 'paredit-wrap-round
    "w[" 'paredit-wrap-square
    "w{" 'paredit-wrap-curly
    "w\"" 'paredit-meta-doublequote
    "s" 'paredit-splice-sexp
    ">" 'paredit-forward-slurp-sexp
    "<" 'paredit-backward-slurp-sexp
    "j" 'paredit-join-sexps
    "owl" 'mg/open-worklog))

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
  (when evil-want-C-u-scroll
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-insert-state-map (kbd "C-u")
      (lambda ()
        (interactive)
        (evil-delete (point-at-bol) (point)))))
  (evil-set-initial-state 'cider-repl-mode 'insert)
  (evil-set-initial-state 'ibuffer-mode 'normal)
  (evil-set-initial-state 'sly-db-mode 'emacs)
  (advice-add 'evil-get-register :filter-args #'evil-fix-star-register)
  (advice-add 'evil-set-register :filter-args #'evil-fix-star-register)
  ;; (advice-add 'evil-quit :before #'mg/kill-after-quit)
  (mg/move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
  (mg/move-key evil-motion-state-map evil-normal-state-map " ")
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :demand t
  :config
  (global-evil-surround-mode 1)
  (telephone-line-evil-config)
  (add-to-list 'evil-surround-operator-alist
               '(evil-paredit-change . change))
  (add-to-list 'evil-surround-operator-alist
               '(evil-paredit-delete . delete))
  )

(use-package evil-matchit
  :ensure t
  :demand t
  :init
  (global-evil-matchit-mode 1))

(use-package evil-org
  :ensure t
  :demand t)

(provide 'evil-init)
