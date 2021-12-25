;;;; Make a program that asks the user for the weight of something and shows
;;;; how much it would weigh in the moon

(defconstant +earth-gravity+ 9.8
  "INT specifying the gravity of the Earth.")
(defconstant +moon-gravity+ 1.62
  "INT specifying the gravity of the Moon.")

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
  (* (/ weight +earth-gravity+)
     +moon-gravity+))
