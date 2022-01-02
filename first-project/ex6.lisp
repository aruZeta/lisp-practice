;;;; Make a program that asks the user an amount of money and shows it in bills
;;;; Example: $565 would be 1 $500 bill, 1 $50, 1 $10 and 1 $5

(uiop:define-package :lisp-practice/first-project/ex6
  (:use :cl)
  (:export main))
(in-package :lisp-practice/first-project/ex6)

(defvar *bills* '(500 200 100 50 20 10 5)
  "LIST of INT specifying the value of the available bills.")

(defun main ()
  "Main function of the program."
  (let ((money (get-money)))
    (print-bills money)))

(declaim (ftype (function () integer) get-money))

(defun get-money ()
  "Ask the user to enter money and return its value."
  (print "Enter the money you want to convert: ")
  (read))

(defun print-bills (money)
  "Shows the money in bills, the bills showed are stored in `*bills*'."
  (loop for bill in *bills* do
    (format t
            "Bills of ~a: ~a~&"
            bill
            (floor money bill))
    (setq money (mod money bill))))