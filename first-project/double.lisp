;;;; Make a program which asks a number and shows its double

(uiop:define-package :lisp-practice/first-project/double
  (:use :cl)
  (:export main))
(in-package :lisp-practice/first-project/double)

(defun main ()
  "Main function of the progam."
  (let ((number (get-number)))
    (format t
            "The double of ~a is: ~a~&"
            number
            (double-n number))))

(declaim (ftype (function () integer) get-number))

(defun get-number ()
  "Ask the user to enter a number and return its value."
  (print "Enter a number: ")
  (read))

(defun double-n (n)
  "Return the double of the number passed."
  (* n 2))