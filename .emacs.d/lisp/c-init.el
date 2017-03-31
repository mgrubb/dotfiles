(use-package c-eldoc
  :commands c-turn-on-eldoc-mode
  :init
  (setq c-eldoc-includes "-I./ -I../ ")
  (add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode))

(use-package cmake-mode
  :commands cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  :config
  (use-package cmake-font-lock
    :init
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)))

(c-add-style "user"
             '("linux"
               (c-basic-offset . 4)     ; Guessed value
               (c-offsets-alist
                (block-close . 0)       ; Guessed value
                (defun-block-intro . 4) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (defun-open . 0)        ; Guessed value
                (innamespace . +)       ; Guessed value
                (namespace-close . 0)   ; Guessed value
                (namespace-open . 0)    ; Guessed value
                (statement . 0)             ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (substatement-open . 0)     ; Guessed value
                (topmost-intro . 0)         ; Guessed value
                (access-label . -)
                (annotation-top-cont . 0)
                (annotation-var-cont . +)
                (arglist-close . c-lineup-close-paren)
                (arglist-cont c-lineup-gcc-asm-reg 0)
                (arglist-cont-nonempty . c-lineup-arglist)
                (arglist-intro . +)
                (block-open . 0)
                (brace-entry-open . 0)
                (brace-list-close . 0)
                (brace-list-entry . 0)
                (brace-list-intro . +)
                (brace-list-open . 0)
                (c . c-lineup-C-comments)
                (case-label . 0)
                (catch-clause . 0)
                (class-close . 0)
                (class-open . 0)
                (comment-intro . c-lineup-comment)
                (composition-close . 0)
                (composition-open . 0)
                (cpp-define-intro c-lineup-cpp-define +)
                (cpp-macro . -1000)
                (cpp-macro-cont . +)
                (do-while-closure . 0)
                (else-clause . 0)
                (extern-lang-close . 0)
                (extern-lang-open . 0)
                (friend . 0)
                (func-decl-cont . +)
                (inclass . +)
                (incomposition . +)
                (inexpr-class . +)
                (inexpr-statement . +)
                (inextern-lang . +)
                (inher-cont . c-lineup-multi-inher)
                (inher-intro . +)
                (inlambda . c-lineup-inexpr-block)
                (inline-close . 0)
                (inline-open . +)
                (inmodule . +)
                (knr-argdecl . 0)
                (knr-argdecl-intro . 0)
                (label . 0)
                (lambda-intro-cont . +)
                (member-init-cont . c-lineup-multi-inher)
                (member-init-intro . +)
                (module-close . 0)
                (module-open . 0)
                (objc-method-args-cont . c-lineup-ObjC-method-args)
                (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
                (objc-method-intro .
                                   [0])
                (statement-case-intro . +)
                (statement-case-open . 0)
                (statement-cont . +)
                (stream-op . c-lineup-streamop)
                (string . -1000)
                (substatement . +)
                (substatement-label . 0)
                (template-args-cont c-lineup-template-args +)
                (topmost-intro-cont . c-lineup-topmost-intro-cont))))

(add-hook 'c-mode-common-hook (lambda () (setq c-default-style "user")))
(provide 'c-init)
