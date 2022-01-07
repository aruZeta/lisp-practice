(uiop:define-package :lisp-practice/first-project/ex3
  (:documentation
   "Program that asks the user a year and shows if it is leap year.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-year)
  (:export main))
(in-package :lisp-practice/first-project/ex3)

(defun main ()
  "Main function of the program."
  (let ((year (get-year)))
    (format t
            "The year ~a is~a a leap year~&"
            year
            (if (leap-year-p year)
                ""
                "n't"))))

(declaim (ftype (function (integer) boolean) leap-year-p))

(defun leap-year-p (year)
  "Return T if YEAR is a LEAP-YEAR. Otherwise, return NIL.
YEAR is a INTEGER.
YEAR is LEAP-YEAR if it is multiple of 4 and not of 100, or multiple of 400."
  (or (zerop (mod year 400))
      (and (zerop (mod year 4))
           (not (zerop (mod year 100))))))
