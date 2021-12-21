(defun main ()
  (let* ((age (askAge)))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (isOfLegalAge age) "yes" "no"))))

(defun askAge ()
  (print "Enter your age: ")
  (read))

(defun isOfLegalAge (age &key (legalAge 18))
  (>= age legalAge))
