(defun longer (x y)
  (labels ((compare (x y)
		   (and (consp x)
			(or (null y)
			    (compare (cdr x) (cdr y))))))
	 (if (and (listp x) (listp y))
	     (compare x y)
	     (> (length x) (length y)))))

(longer '(1 2) '(1)) ; T
(longer nil '(1)) ; nil
(longer '(1) '(1 2)) ; nil

(defun filter (fn lst)
  (let ((acc nil))
    (dolist (x lst)
      (if (funcall fn x)
	  (push x acc)))
    (nreverse acc)))

(filter #'evenp '(1 2 3 4)) ; (2 4)
(filter #'evenp nil) ; nil
(filter #'evenp 10); crash

(defun group (lst n)
  (if (zerop n) (error "zero length groups!!!"))
  (labels ((rec (lst acc)
	     (let ((remaini (nthcdr n lst)))
	       (if (consp remaini)
		   (rec remaini (cons (subseq lst 0 n) acc))
		   (nreverse (cons lst acc))))))
    (if lst (rec lst nil))))

(group '(1 2 3 4) 3) ; ((1 2 3) 4)
(group '(1 2 3) 4) ; ((1 2 3))


       
