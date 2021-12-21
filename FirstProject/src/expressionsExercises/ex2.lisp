(defun main ()
  (let ((number (get-number)))
    (format t
            "~a is~a multiple of 7~&"
            number
            (if (multiple-of-7-p number)
                ""
                "n't"))))

(defun get-number ()
  (print "Enter a number: ")
  (read))

(defun multiple-of-7-p (n)
  (= (mod n 7) 0))
