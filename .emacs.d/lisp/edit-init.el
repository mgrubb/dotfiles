;; Handle UTF-8 input
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")

;; Ensure that files end with a newline character
(setq require-final-newline t)
;; Show matching parens
(show-paren-mode 1)

;; Like nowrap in vim
(set-default 'truncate-lines t)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Use aggressive indent
(use-package aggressive-indent
  :ensure t
  :diminish (aggressive-indent-mode . ">")
  :config
  (global-aggressive-indent-mode 1))

;; Rainbow parens
(use-package rainbow-delimiters
  :ensure t
  :commands (rainbow-delimiters-mode)
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; backup in one place, no trees
(let ((user-temp (concat user-emacs-directory "tmp/")))
  (setq backup-directory-alist `((".*" . ,user-temp)))
  (setq auto-save-file-name-transforms `((".*" ,user-temp t))))

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; Isolate kill-ring from clipboard
(defun isolate-kill-ring ()
  "Isolate Emacs kill ring from OS X system pasteboard.
This function is only necessary in window system."
  (interactive)
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil))

(defun pasteboard-copy ()
  "Copy region to OS X system pasteboard."
  (interactive)
  (ns-set-pasteboard
   (buffer-substring (region-beginning) (region-end))))

(defun pasteboard-paste ()
  "Paste from OS X system pasteboard via `pbpaste` to point."
  (interactive)
  (when mark-active
    (delete-region (region-beginning) (region-end)))
  (insert (ns-get-pasteboard)))

(defun pasteboard-cut ()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(defun graphic-display-config (frame)
  (with-selected-frame frame
    (when (display-graphic-p)
      (isolate-kill-ring)
      ;; Bind CMD-{c,v,x} to copy, paste, cut
      (global-set-key (kbd "s-c") 'pasteboard-copy)
      (global-set-key (kbd "s-v") 'pasteboard-paste)
      (global-set-key (kbd "s-x") 'pasteboard-cut))))

;;(add-hook 'after-make-frame-functions 'graphic-display-config)
(use-package simpleclip
  :ensure t
  :demand t
  :config
  (simpleclip-mode 1))

;; use tab for indent and complete
(setq tab-always-indent 'complete)


(provide 'edit-init)
