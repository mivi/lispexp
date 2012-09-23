(car '(1 2 3)) ; 1
(append '(1 2 3) '(4 5)) ; (1 2 3 4 5)

(setq x '(a b))
(nconc x '(a b))
(format t "~a~%" x) ; (A B A B)

;; consp works for any type but returns true for list of length more than 1
(consp nil) ; NIL
(consp 'A) ; nil
(consp '(A)) ; t
(consp '(A B)) ; t
(consp 0) ; nil

;; listp works on any types but returns true for lists only (including nil)
(listp nil) ; t
(listp 'A) ; nil
(listp '(A)) ; t
(listp '(A B)) ; t
(listp 0) ; nil

;; zerop is valid for numeric only
(zerop nil); CRASH
(zerop -1) ; nil
(zerop 0) ; t
(zerop 0.0) ; t
(zerop 0.1) ; nil
(zerop 1.1) ; nil
(zerop (truncate 0.1)) ; t

;; length on list, string etc but for non valid types => crash
(length "vis") ; 3
(length "") ; 0
(length 'AV) ; crash
(length 0) ; crash

;; car only works on list and for empty list returns nil
(car 0) ; crash
(car nil) ; nil
(car 'A) ; crash
(car '(A B)) ; A
;; last also works for lists and always returns list
(last '(A B)) ; (B)
(last nil) ; nil
(last "vis") ; crash

(nth 0 nil) ; nil
(nth 2 nil) ; nil
(nth 2 '(A B C)) ; C
(1- 10) ; 9

(list ) ; nil
(list 'A 'B) ; (A B)

(append 10 20) ; crash
(append nil nil) ; nil
(append nil '(A)) ; (A)
(append nil 'A) ; A
(append 'A nil) ; crash

(nconc 10 20) ; crash
(nconc nil nil) ; nil
(nconc nil '(A)) ; (A)
(nconc nil '(A) '(B C)) ; (A B C)
(nconc nil 'A) ; A
(nconc 'A nil) ; crash

(cons 'A '(B C)) ; (A B C)
(cons nil '(B C)) ; (NIL B C)
(setq x (cons '(X Y) '(A B))) ; ((X Y) A B)
(push 'Z x) ; (Z (X Y) A B)  <= X
(push x 'Z) ; crash (variable Z is unbound)
(cons '(M N) x) ; ((M N) Z (X Y) A B)
(nconc x '(P Q)) ; (Z (X Y) A B P Q) <= X
(nconc x '(L M)) ; (Z (X Y) A B P Q L M) <= X

(cons 'A 'B) ; (A . B)
(cons nil 'B) ; (NIL . B)

; http://www.lispworks.com/documentation/HyperSpec/Body/f_mapc_.htm
(mapcar #'cons '(a b c) '(1 2 3)) ; ((A . 1) (B . 2) (C . 3))
(mapc #'cons '(a b c) '(1 2 3)) ; (A B C) ; applied to list but result not accumulate
(maplist #'cons '(a b c) '(1 2 3)) ; (((A B C) 1 2 3) ((B C) 2 3) ((C) 3))
(mapl #'(lambda (x y) (format t "~a~%" (cons x y))) '(a b c) '(1 2 3))
; ((A B C) 1 2 3)
; ((B C) 2 3)
; ((C) 3)
; 
; (A B C)
(mapcan #'cons '(a b c) '(1 2 3)) ; (A B C . 3)
(mapcan #'cons '(a b c) '((1) (2) (3))) ; (A 1 B 2 C 3)
(mapcar #'cons '(a b c) '((1) (2) (3))) ; ((A 1) (B 2) (C 3))
(funcall #'append '(A B) '(C D) '(E F)) ; (A B C D E F)
(funcall #'nconc '(A B) '(C D) '(E F)) ; (A B C D E F)

; mapcan is like mapcar but uses nconc to build list
; mapcon is like maplist but uses nconc to build list

(subseq '(1 2 3 4) 1 2) ; (2) ; both are indexes
(subseq '(1 2 3 4) 3 10) ; crash
(subseq '(1 2 3 4) 2 1) ; crash

(nthcdr 2 '(1 2 3)) ; (3)
(nthcdr 4 '(1 2 3)) ; nil

