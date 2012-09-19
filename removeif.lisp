(defun my-remove-if (fn list)
  (if (null list)
      nil
      (if (funcall fn (car list))
	  (my-remove-if fn (cdr list))	;remove current elem and apply on rest
	  (cons (car list) (my-remove-if fn (cdr list))))))


(my-remove-if #'evenp '(1 2 3 4))

(format t "~{~a:~10t~a~}~10t~a~%" (list :title 10) 10)

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun print-hello () 
  (format t "hello world"))

