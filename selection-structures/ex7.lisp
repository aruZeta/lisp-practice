(uiop:define-package :lisp-practice/selection-structures/ex7
  (:documentation
   "Program that asks the user a number and shows how many digits it has.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex7)

(declaim (ftype (function (positive) positive)
                digits))

(defun main ()
  "Main function of the program."
  (let ((number (get-positive "Enter a number: ")))
    (format t
            "It has ~a digits~&"
            (digits number))))

(defun digits (number)
  "Return the length (number of digits) of NUMBER.
NUMBER is a POSITIVE."
  (1+ (truncate (log number 10d0))))
