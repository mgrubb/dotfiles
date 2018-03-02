(defun make-set ()
  (make-hash-table))

(defun add-to-set (element set)
  (if (and (sequencep element)
           (not (stringp element)))
      (progn
        (seq-do (lambda (e) (puthash e t set)) element)
        t)
    (puthash element t set)))

(defun in-set-p (element set)
  (gethash element set nil))

(defun remove-from-set (element set)
  (remhash element set))

(defun set-to-list (set)
  (hash-table-keys set))

(provide 'set)
