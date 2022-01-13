(uiop:define-package :lisp-practice/selection-structures/ex9
  (:documentation
   "Program that asks the user a number and shows if it is a palindrome.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex9)

(declaim (ftype (function (positive) boolean)
                palindromep)
         (ftype (function (positive) positive)
                reverse-n))

(defun main ()
  "Main function of the program."
  (let ((number (get-positive "Enter a number: ")))
    (format t
            "The number is~a a palindrome~&"
            (if (palindromep number)
                ""
                "n't"))))

(defun palindromep (number)
  "Return T if NUMBER is a palindrome. Otherwise, return NIL.
NUMBER is a POSITIVE."
  (= (reverse-n number)
     number))

(defun reverse-n (n)
  "Return the reverse of N.
N is a POSITIVE."
  (let ((reversed-n 0))
    (loop while (> n 0) do
      (setq reversed-n (+ (* reversed-n 10)
                          (mod n 10))
            n (floor n 10)))
    reversed-n))
