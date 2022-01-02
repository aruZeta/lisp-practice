;;;; Make a program that asks the user for the weight of something and shows
;;;; how much it would weigh in the moon

(uiop:define-package :lisp-practice/first-project/ex4
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-weight)
  (:export main))
(in-package :lisp-practice/first-project/ex4)

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

(defun weight-in-moon (weight)
  "Returns how much something in the earth would weigh in the moon."
  (* (/ weight +earth-gravity+)
     +moon-gravity+))
