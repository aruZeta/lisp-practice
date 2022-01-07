;;;; Make a program that asks the user an amount of money and shows it in bills
;;;; Example: $565 would be 1 $500 bill, 1 $50, 1 $10 and 1 $5

(uiop:define-package :lisp-practice/first-project/ex6
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:int-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-money)
  (:export main))
(in-package :lisp-practice/first-project/ex6)

(declaim (type (int-list) *bills*))

(defvar *bills* '(500 200 100 50 20 10 5)
  "INTEGER LIST specifying the value of the available bills.")

(defun main ()
  "Main function of the program."
  (let ((money (get-money)))
    (print-bills money)))

(declaim (ftype (function (integer)) print-bills))

(defun print-bills (money)
  "Shows how much of each BILL is necessary to reach MONEY.
MONEY is a INTEGER.
BILL is a INTEGER specifying a bill in `*bills*'."
  (loop for bill in *bills* do
    (format t
            "Bills of ~a: ~a~&"
            bill
            (floor money bill))
    (setq money (mod money bill))))
