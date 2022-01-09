(uiop:define-package :lisp-practice/first-project/double
  (:documentation
   "Program that asks a number and shows its double.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/first-project/double)

(declaim (ftype (function (real) real)
                double-n))

(defun main ()
  "Main function of the progam."
  (let ((number (get-real "Enter a number: ")))
    (format t
            "The double of ~a is: ~a~&"
            number
            (double-n number))))

(defun double-n (n)
  "Return the double of N.
N is a INTEGER."
  (* n 2))
