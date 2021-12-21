(defun main ()
  (let ((age (get-age)))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (legal-age-p age) "yes" "no"))))

(defun get-age ()
  (print "Enter your age: ")
  (read))

(defun legal-age-p (age &key (legal-age 18))
  (>= age legal-age))
