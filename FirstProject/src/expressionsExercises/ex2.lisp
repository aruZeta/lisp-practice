(defun main ()
  "Main function of the progam."
  (let ((number (get-number)))
    (format t
            "~a is~a multiple of 7~&"
            number
            (if (multiple-of-7-p number)
                ""
                "n't"))))

(defun get-number ()
  "Ask the user to enter a number and return its value."
  (print "Enter a number: ")
  (read))

(defun multiple-of-7-p (n)
  "Return T if the number passed is multiple of 7. Otherwise, return NIL."
  (= (mod n 7) 0))
