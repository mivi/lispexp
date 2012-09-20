(if (< 2 3) "v1" "v2")
; C-x C-e ; eval expr (cursor at end of line)

(if (< 4 3) "v1" '(1 2 3))
(if (< 4 3) "v1")

;(if (< 44 3) "v1" (let (x 10)
		    
;(defun try-progn ()
  (defvar *qq* 0)
  (if (< 2 3) 
      (progn
	(incf *qq*)
	(incf *qq*)));)

;(try-progn)

(defmacro mywhen (condition &rest body)
  `(if ,condition
      (progn ,@body)))

(mywhen (< 2 3)
	(incf *qq*)
	(incf *qq*))

(dotimes (x 2)
  (dotimes (y 2)
    (format t "~a " (list x y)))
  (format t "~%"))
