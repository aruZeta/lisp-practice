;;;; Make a program that asks the user 2 numbers and shows them ordered from
;;;; highest to lowest

(uiop:define-package :lisp-practice/selection-structures/order-2-numbers
  (:use :cl)
  (:import-from :lisp-practice/utils/types #:int-list)
  (:import-from :lisp-practice/utils/get-input #:get-number)
  (:export main))
(in-package :lisp-practice/selection-structures/order-2-numbers)

(defun main ()
  "Main function of the program."
  (let ((n1 (get-number))
        (n2 (get-number)))
    (dolist (n (sort-2 n1 n2))
      (format t "~a " n))
    (format t "~&")))

(declaim (ftype (function (integer integer) int-list) sort-2))

(defun sort-2 (n1 n2)
  "Return LIST with N1 and N2 ordered from highest to lowest.
N1 is a INTEGER.
N2 is a INTEGER."
  (if (> n1 n2)
      `(,n1 ,n2)
      `(,n2 ,n1)))
