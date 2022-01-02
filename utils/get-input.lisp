;;;; Get input from user functions used by the programs

(uiop:define-package :lisp-practice/utils/get-input
  (:use :cl)
  (:import-from :lisp-practice/utils/types #:positive)
  (:export get-liters
           get-number
           get-character
           get-marital-status-alias))
(in-package :lisp-practice/utils/get-input)

(declaim (ftype (function () positive) get-liters))

(defun get-liters ()
  "Ask the user to enter LITERS and return its value.
LITERS is a POSITIVE specifying an amount of liters."
  (print "Enter how much liters you've used this month: ")
  (read))

(declaim (ftype (function () integer) get-number))

(defun get-number ()
  "Ask the user to enter INTEGER and return its value."
  (print "Enter a number: ")
  (read))

(declaim (ftype (function () character) get-character))

(defun get-character ()
  "Ask the user to enter CHARACTER and return its value."
  (print "Enter a character: ")
  (read-char))

(declaim (ftype (function () character) get-marital-status-alias))

(defun get-marital-status-alias ()
  "Ask the user to enter ALIAS and return its value.
ALIAS is a CHARACTER representing an alias of MARITAL STATUS in
`*alias-to-marital-status-alist*'."
  (print "Enter the character representing your marital status (alias): ")
  (read-char))
