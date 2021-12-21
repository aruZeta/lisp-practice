;;;; Make a program that asks the user for 3 programs and shows if they are
;;;; ordered

(defun main ()
  "Main function of the program."
  (let ((a (get-number))
        (b (get-number))
        (c (get-number)))
    (format t
            "The numbers are~a ordered"
            (if (ordered-p a b c)
                ""
                "n't"))))

(defun get-number ()
  "Ask the user to enter a number and return its value."
  (print "Enter a number: ")
  (read))

(defun ordered-p (n1 n2 n3)
  "Return T if the 3 values passed are ordered from lowest to highest or highest
to lowest. Otherwise, return NIL"
  (or (> n1 n2 n3)
      (< n1 n2 n3)))
