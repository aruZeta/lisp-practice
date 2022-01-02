;;;; Get input from user functions used by the programs

(uiop:define-package :lisp-practice/utils/get-input
  (:use :cl)
  (:import-from :lisp-practice/utils/types #:positive)
  (:export get-liters))
(in-package :lisp-practice/utils/get-input)

(declaim (ftype (function () positive) get-liters))

(defun get-liters ()
  "Ask the user to enter LITERS and return its value.
LITERS is a POSITIVE specifying an amount of liters."
  (print "Enter how much liters you've used this month: ")
  (read))
