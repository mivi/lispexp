;; (defun my-make-list (n init)
;;   (if (zerop n)
;;       nil
;;       (cons init (my-make-list (1- n) (1+ init)))))
(defun my-make-list (n init)
  (labels ((rec (n init acc)
	     (if (zerop n)
		 acc
		 (rec (1- n) (1+ init) (cons init acc)))))
    (rec n init nil)))

(defun my-make-rlist (n init)
  (let ((acc nil))
    (labels ((rec (n init)
	       (if (zerop n)
		   acc
		   (progn
		     (push init acc)
		     (rec (1- n) (1+ init))))))
      (rec n init))))

(time (last (reverse (my-make-list 10000 1))))

(pathname "c:/")
