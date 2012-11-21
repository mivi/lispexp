(defvar *!myhash* (make-hash-table :test #'equal))

(setf (gethash '(1 2 (3 4) 5) *!myhash*) "vishal")
(gethash '(1 2 (3 4) 5) *!myhash*)

(find-if fn '(1 2 3 4 5))




(defun mylength (lst)
  (if (null lst)
      0
      (1+ (mylength (cdr lst)))))

(defun lrec (fn &optional base)
  (labels ((rec (lst)
	     (if (null lst)
		 (if (functionp base)
		     (funcall base)
		     base)
		 (funcall fn (car lst)
			   #'(lambda ()
			       (rec (cdr lst)))))))
    #'rec))



(funcall (lrec #'(lambda (x fn) (if (evenp x) x (funcall fn))) 0) '(1 2 3 4 5))

(atom nil) ; T
(listp nil) ; T

;; dotted-pair notation
;; one nil for each pair of paranthesis
((a b (c d)) (e) f)
((a b (c d)) . ((e) f))
((a . (b (c d))) . ((e) f))
((a . (b . ((c d) . nil))) . ((e) f))
((a . (b . ((c . (d)) . nil))) . ((e) f))
((a . (b . ((c . (d . nil)) . nil))) . ((e) f))
((a . (b . ((c . (d . nil)) . nil))) . ((e . nil) f))
((a . (b . ((c . (d . nil)) . nil))) . ((e . nil) . f))
((a . (b . ((c . (d . nil)) . nil))) . ((e . nil) . (f . nil)))

(cons '(30) (cons 10 20))

(setq x '(1 (2 3) (4 5)))
(setf x1 (car (cdr x)))
(setf x2 (car (cdr (cdr x))))
;; these two have no effect
(setf x1 '(77 88))
(nconc x1 '(67 89 90))
x
;; these have effect
(setf (car (cdr x)) '(7 8))
(nconc (car (cdr x)) '(67 89 90))
x

(format t "~a~%" *print-case*)
