(defun main ()
  "Main function of the program."
  (let ((year (get-year)))
    (format t
            "The year ~a is~a a leap year~&"
            year
            (if (leap-year-p year)
                ""
                "n't"))))

(defun get-year ()
  "Ask the user to enter a year and return its value."
  (print "Enter a year: ")
  (read))

(defun leap-year-p (year)
  "Return T if the year passed is multiple of 4 and not of 100, or multiple of
400. Otherwise, return NIL."
  (or (= (mod year 400) 0)
      (and (= (mod year 4) 0)
           (not (= (mod year 100) 0)))))
