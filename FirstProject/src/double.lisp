(defun main ()
  (let ((number (get-number)))
    (format t
            "The double of ~a is: ~a~&"
            number
            (double-n number))))

(defun get-number ()
  (print "Enter a number: ")
  (read))

;; The double function already exists
(defun double-n (n)
  (* n 2))
