(defstruct node contents yes no)
(defvar *nodes* (make-hash-table))
(defun defnode (name conts &optional yes no)
  (setf (gethash name *nodes*)
	(make-node :contents conts
		   :yes yes
		   :no no)))

(defnode 'people "is the person a man?" 'male 'female)

(read)

(defvar *nodes* nil)
(setf *nodes* (acons 'vis '("a" "bb" "c") *nodes*))
(third (assoc 'vis *nodes*))

(remove-if #'symbolp '(1 2 3))

(symbolp (gensym))

(progn (setq seq '(b a)) 'a)
(the fixnum (- 10 20))
(before


(cdr (cons 10 20))

(directory (make-pathname :name :wild :type :wild :defaults "c:/"))


