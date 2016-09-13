;; Make adding several things to several hooks a little more convenient
;;(defun add-hooks (modes &rest hooks)
;; (let ((hooks (if (listp hooks) hooks (list hooks)))
;;       (value))
;;  (dolist (hook hooks)
;;   (dolist (mode modes)
;;    (add-hook hook mode)))))

(defun add-hooks (functions hooks)
 (let ((hooks (if (listp hooks) hooks (list hooks)))
       (functions (if (listp functions) functions (list functions))))
  (mapc (lambda (hook)
         (mapc (lambda (f)
                (add-hook hook f))
          functions))
   hooks)))


(defmacro leader-key-for-modes (modes &rest keys)
  (let ((value))
    `(progn
       ,@(dolist (mode modes value)
           (setq value (cons (append `(evil-leader/set-key-for-mode ,mode) keys) value))))))

(defmacro if-not
    (pred then &rest else)
  "negative if test

(if-not PRED THEN ELSE...)"
  `(if (not ,pred)
       ,then
     ,@else...))

(defmacro when-not
    (pred &rest then)
  "Negative when

(fn PRED THEN...)"
  `(when (not ,pred)
     ,@then...))
