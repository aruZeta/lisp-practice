;;;; Program to test some operators

(defun main ()
  "Main function of the program."
  (let ((a 2)
        (b 8)
        (c 3)
        (letter #\f)
        (ink t)
        (paper t))
    (format t "~a~&" (incf a))
    (format t "~a~&" a)
    (format t "~a~&" (= a c))
    (format t "~a~&" (> a b))
    (format t "~a~&" (char= letter #\w))
    (format t "Can I print? ~a~&" (if (and ink paper)
                                      "Yes"
                                      "No"))))
