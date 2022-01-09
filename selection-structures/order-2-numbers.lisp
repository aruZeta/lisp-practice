(uiop:define-package :lisp-practice/selection-structures/order-2-numbers
  (:documentation
   "Program that asks the user 2 numbers and shows them ordered.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:real-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/selection-structures/order-2-numbers)

(declaim (ftype (function (real real) real-list)
                sort-2))

(defun main ()
  "Main function of the program."
  (let ((n1 (get-real "Enter a number: "))
        (n2 (get-real "Enter a number: ")))
    (dolist (n (sort-2 n1 n2))
      (format t "~a " n))
    (format t "~&")))

(defun sort-2 (n1 n2)
  "Return LIST with N1 and N2 ordered from highest to lowest.
N1 is a INTEGER.
N2 is a INTEGER."
  (if (> n1 n2)
      `(,n1 ,n2)
      `(,n2 ,n1)))
