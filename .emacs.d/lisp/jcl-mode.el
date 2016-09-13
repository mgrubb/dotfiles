(setq jcl-mode-highlights
      '(("\\<\\(JOB\\|DD\\|EXEC\\|PROC\\)\\>" . font-lock-function-name-face)
        ("^//\\*.*" . font-lock-comment-face)
        ("^//" . font-lock-comment-face)
        ("^//")
        ))

(defvar upcase-transient-map
  (let ((map (make-sparse-keymap)))
    (define-key map [remap self-insert-command] #'upcase-self-insert-command)
    map))

(defun upcase-self-insert-command ()
  (interactive)
  (let ((last-command-event 
         (upcase last-command-event)))
    (self-insert-command 1)))

(defun upcase-able-p ()
  (let ((case-fold-search nil))
    (not (char-equal
          last-command-event (capitalize last-command-event)))))

(defun upcase-transient-mode ()
  (interactive)
  (set-transient-map upcase-transient-map #'upcase-able-p))


(define-derived-mode jcl-mode fundamental-mode
  (setq font-lock-defaults '(jcl-mode-highlights))
  (setq mode-name "JCL")
  
  )

(provide 'jcl-mode)
