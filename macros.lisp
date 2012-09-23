(eql (list 'a 'b 'c) `(a b c)) ; NIL
(list 'a 'b 'c) ; (A B C)
`(a b c) ; (A B C) 
'('a 'b 'c); ('A 'B 'C)
(list ''a 'b 'c) ; ('A B C)
(list '''a 'b 'c) ; (''A B C)

(signum -2.5) ; -1.0
(= (truncate (signum 2.5)) 1) ; TRUE
(string= "vis" "vis") ; TRUE

(eq 'A 'A) ; T
(eql '('A) '('A)) ; NIL
'('A 'B)

;; splicing - comma-at
(setq x '(1 2 3))
`(4 ,@x); (4 1 2 3)
`(4 ,x); (4 (1 2 3))
(setq x 2)
`(4 ,@x) ; (4 . 2)
`(4 ,@x 10) ; ERROR

(defmacro nil! (x)
;  (list 'setq x nil))
  `(setq ,x nil))

(nil! x)
(eql 'A 'a)

;; PRE section 7.3 ; by look at :test
(defmacro myeq (x y type)
  `(case ,type
     (:string (string= ,x ,y))
     (:number (= ,x ,y))))

(myeq "vis" "vis" :string) ;(CASE :STRING (':STRING (STRING= "vis" "vis")) (':NUMBER (= "vis" "vis")))
(myeq 1 1 :number)

(defmacro myeq2 (x y type)
  (case type
     (:string `(string= ,x ,y))
     (:number `(= ,x ,y))))

(myeq2 "vis" "vis" :string) ;(STRING= "vis" "vis")
(myeq2 1 1 :number) ; (= 1 1)

;; section 7.3 memq
(member 10 '(1 2 3 10 15 34)) ; (10 15 34)
(member '(1 2) '(1 2 10 (10 1 2 4) (1 2) 45 36) :test #'equal) ; ((1 2) 45 36)

(defmacro memq (x xs)
  `(member ,x ,xs :test #'equal))

(memq '(1 2) '(1 2 10 (10 1 2 4) (1 2) 45 36)) ; ((1 2) 45 36)
(memq 10 '(1 2 3 10 15 34)) ; (10 15 34)

;; section 7.3 while
(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))

(setq x 10)
(while (> x 0)
  (format t "~a ~%" x)
  (decf x))

(not 10) ; NIL
(not -1) ; NIL

;; Destructuring 
(setq (x y (z) . k) (1 (2 3) (4) 6 7 (8 9) 0))
(if (< 2 3) "v1" "v2")
;;
(dolist (x '(1 2 3))
  (format t "~a~%" x)
  (format t "~a~%" (1+ x)))

(defmacro mydolist ((var list &optional result) &body body)
  `(progn
     (mapc #'(lambda (,var) ,@body)
	   ,list)
     (let ((,var nil))
       ,result)))

(mydolist (x '(1 2 3))
  (format t "~a~%" x)
  (format t "~a~%" (1+ x)))
  
;;
(defmacro when-bind ((var expr) &body body)
  `(let ((,var ,expr))
     (when ,var
       ,@body)))

(when-bind (x (+ 3 5))
  (format t "~a~%" x))

;; section 7.6
(get when-bind 'expander)
(car '(when-bind (x (+ 3 5))
  (format t "~a~%" x)))
;; EMACS TIPS (SLIME)
; C-x C-e ; eval expr (cursor at end of line)
; C-c RET ; to check macro expansion (with cursor in macro call start brace)
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

; fibonacci series
(do ((n 0 (+ 1 n))
     (cur 0 next)
     (next 1 (+ cur next)))
    ((= n 10) cur)
  (format t "~a " cur)
;  (sleep 1)
  (format t "~a~%" (+ cur 1)))
  

(find "vishal" "aeiou")

(mod (sqrt 36.6))
(zerop 0.1)

(defun next-prime (number)
  (do ((n number (1+ n)))
      ((is-prime n) n)))

(defun is-prime (number)
  (when (> number 1)
    (do ((n 2 (1+ n))
	 (maxi (isqrt number)))
	((or (> n maxi) (= 0 (mod number n))) 
	 (not (= 0 (mod number n))))
      (format t "~a ~a ~a ~%" n maxi (mod number n)))))
;(> n (isqrt number)) t)

(defun do-primes (start end)
  (do ((lst nil)
       (cur (next-prime start) (next-prime (+ cur 1))))
      ((> cur end) (nreverse lst))
    (push cur lst)))

(do-primes 0 450)    
(- 10 2 3)
(is-prime 3)
(isqrt 2)
(not (= 0 (mod 10 2)))
(not 1)
(setf *ass* (list 1 2 3))
(push 4 *ass*)

(do ((var 0 (1+ var)))
    ((> var 9)))

