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

(defun flatten (x)
  (labels ((rec (x acc)
	     (cond ((null x) acc)
		   ((atom x) (cons x acc))
		   (t (rec (car x) (rec (cdr x) acc))))))
    (rec x nil)))

(flatten '(nil 10 (5 6 (7 8 9 (10 (11)) 12) 13 14) 15 16))

;; PRUNE  (like remove-if for trees)
;; tree || acc
;; (1 (2 3) 4 5)   || nil
;; ((2 3) 4 5)     || (1)			; (case 2)
;; (4 5)           || (cons (rec (2 3) nil) acc)
(defun prune (fn tree)
  (labels ((rec (tree acc)
	     (cond 
	       ((null tree) (nreverse acc))	;terminate
	       ((consp (car tree))	;case 2
		(rec (cdr tree) (cons (rec (car tree) nil) acc)))
	       ((null (car tree)) (rec (cdr tree) acc))
	       (t (if (funcall fn (car tree))
		      (rec (cdr tree) acc)
		      (rec (cdr tree) (cons (car tree) acc)))))))
    (rec tree nil)))
  
(prune #'evenp '(1 (2 3 (6 7 nil 8 9) 4 5) 4 5))
(prune #'evenp '(1 2 3))
(prune #'evenp '(nil))

