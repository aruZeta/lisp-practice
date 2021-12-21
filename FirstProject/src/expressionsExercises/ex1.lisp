(defun main ()
  "Main function of the progam."
  (let ((age (get-age)))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (legal-age-p age) "yes" "no"))))

(defun get-age ()
  "Ask for the age of the user and return its value."
  (print "Enter your age: ")
  (read))

(defun legal-age-p (age &key (legal-age 18))
  "Return T if the passed age is above or equal to the default legal age, or the
one passed. Otherwise, return NIL."
  (>= age legal-age))
