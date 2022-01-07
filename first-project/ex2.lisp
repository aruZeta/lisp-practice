(uiop:define-package :lisp-practice/first-project/ex2
  (:documentation
   "Program that asks the user a number and shows if it is multiple of 7.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/ex2)

(defun main ()
  "Main function of the progam."
  (let ((number (get-number)))
    (format t
            "~a is~a multiple of 7~&"
            number
            (if (multiple-of-7-p number)
                ""
                "n't"))))

(declaim (ftype (function (integer) boolean) multiple-of-7-p))

(defun multiple-of-7-p (n)
  "Return T if N is multiple of 7. Otherwise, return NIL.
N is a INTEGER."
  (zerop (mod n 7)))
