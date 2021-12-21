(defun main ()
  (let ((number (getNumber)))
    (format t
            "The double of ~a is: ~a~&"
            number
            (aru/double number))))

(defun getNumber ()
  (print "Enter a number: ")
  (read))

;; The double function already exists
(defun aru/double (n)
  (* n 2))
