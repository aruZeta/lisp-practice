(defun main ()
  (let ((number (getNumber)))
    (format t
            "~a is~a multiple of 7~&"
            number
            (if (isMultipleOf7 number)
                ""
                "n't"))))

(defun getNumber ()
  (print "Enter a number: ")
  (read))

(defun isMultipleOf7 (n)
  (= (mod n 7) 0))
