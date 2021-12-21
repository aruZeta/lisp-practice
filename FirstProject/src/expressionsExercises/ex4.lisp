(defvar *earth-gravity* 9.8)
(defvar *moon-gravity* 1.62)

(defun main ()
  "Main function of the progam."
  (let ((weight (get-weight)))
    (format t
            "In the moon you would weigh: ~a~&"
            (weight-in-moon weight))))

(defun get-weight ()
  "Ask the user to enter a weight and return its value."
  (print "Enter your weight: ")
  (read))

(defun weight-in-moon (weight)
  "Returns how much something in the earth would weigh in the moon."
  (* (/ weight *earth-gravity*)
     *moon-gravity*))
