(uiop:define-package :lisp-practice/first-project/ex4
  (:documentation
   "Program that asks the user for the weight of something and shows how much it
would weigh in the moon.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/first-project/ex4)

(declaim (type (float)
               +earth-gravity+
               +moon-gravity+)
         (ftype (function (real) float)
                weight-in-moon))

(defconstant +earth-gravity+ 9.8
  "FLOAT specifying the gravity of the Earth.")
(defconstant +moon-gravity+ 1.62
  "FLOAT specifying the gravity of the Moon.")

(defun main ()
  "Main function of the progam."
  (let ((weight (get-real "Enter your weight: ")))
    (format t
            "In the moon you would weigh: ~a~&"
            (weight-in-moon weight))))

(defun weight-in-moon (weight)
  "Return how much WEIGHT would weigh in the moon.
WEIGHT is a REAL."
  (* (/ weight +earth-gravity+)
     +moon-gravity+))
