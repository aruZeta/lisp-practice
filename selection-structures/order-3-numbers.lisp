(uiop:define-package :lisp-practice/selection-structures/order-3-numbers
  (:documentation
   "Program that asks the user 3 numbers and shows them ordered.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:real-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/selection-structures/order-3-numbers)

(declaim (ftype (function (real real real) real-list)
                sort-3))

(defun main ()
  "Main function of the program."
  (let ((n1 (get-real "Enter a number: "))
        (n2 (get-real "Enter a number: "))
        (n3 (get-real "Enter a number: ")))
    (dolist (n (sort-3 n1 n2 n3))
      (format t "~a " n))
    (format t "~&")))

(defun sort-3 (n1 n2 n3)
  "Return LIST with N1, N2 and N3 ordered from highest to lowest.
N1 is a INTEGER.
N2 is a INTEGER.
N3 is a INTEGER."
  (when (> n2 n1)
    (let ((temp n1))
      (setq n1 n2
            n2 temp)))
  (when (> n3 n2)
    (let ((temp n2))
      (setq n2 n3
            n3 temp)))
  (when (> n2 n1)
    (let ((temp n1))
      (setq n1 n2
            n2 temp)))
  `(,n1 ,n2 ,n3))
