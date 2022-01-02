;;;; Make a program which asks a number and shows its double

(uiop:define-package :lisp-practice/first-project/double
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/double)

(defun main ()
  "Main function of the progam."
  (let ((number (get-number)))
    (format t
            "The double of ~a is: ~a~&"
            number
            (double-n number))))

(defun double-n (n)
  "Return the double of the number passed."
  (* n 2))
