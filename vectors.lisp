(defparameter *v* (make-array '(4 5) :initial-element 1))
*v*
;(elt *v* '(2 1))
(aref *v* 2 1)

(setf (aref *v* 2 1) 4)

(defparameter *v* (list (make-array 30 :initial-element 1 :adjustable t :fill-pointer 3 :element-type 'integer) (make-array 30 :initial-element 2 :adjustable t :fill-pointer 3 :element-type 'integer))) ; array is not adjustable beyond array size
*v*
(setf (aref (car (cdr *v*)) 3) 10)
(vector-push 30 (car (cdr *v*)))
(car (cdr *v*))

(defparameter *a* (make-array 5 :fill-pointer 0))
(vector-push 30 *a*)
*a*

(defparameter *as* nil)
(setf (getf *as* 'a) 10)
(setf (getf *as* 'B) 20)
(get-properties *as* '(a b a))

*as*

(defun process-properties (plist keys)
  (loop while plist do
       (multiple-value-bind (key value tail) (get-properties plist keys)
	 (format t "~a~%" tail))))

(process-properties *as* '(a b a))
