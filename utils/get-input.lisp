(uiop:define-package :lisp-practice/utils/get-input
  (:documentation
   "Collection of functions to get input from the user.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive
                #:date
                #:day))
(in-package :lisp-practice/utils/get-input)

(declaim (ftype (function () character)
                get-character
                get-marital-status-alias)
         (ftype (function () integer)
                get-age
                get-dni
                get-hours
                get-minutes
                get-money
                get-number
                get-seconds
                get-year)
         (ftype (function (&optional boolean boolean) (or date day))
                get-date)
         (ftype (function () (or float integer))
                get-weight)
         (ftype (function () positive)
                get-liters))

(defun get-liters ()
  "Ask the user to enter LITERS and return its value.
LITERS is a POSITIVE specifying an amount of liters."
  (format t "Enter how much liters you've used this month: ")
  (read))

(defun get-number ()
  "Ask the user to enter INTEGER and return its value."
  (format t "Enter a number: ")
  (read))

(defun get-character ()
  "Ask the user to enter CHARACTER and return its value."
  (format t "Enter a character: ")
  (read-char))

(defun get-marital-status-alias ()
  "Ask the user to enter ALIAS and return its value.
ALIAS is a CHARACTER representing an alias of MARITAL STATUS in
`*alias-to-marital-status-alist*'."
  (format t "Enter the character representing your marital status (alias): ")
  (read-char))

(defun get-age ()
  "Ask for the age of the user and return its value."
  (format t "Enter your age: ")
  (read))

(defun get-year ()
  "Ask the user to enter a year and return its value."
  (format t "Enter a year: ")
  (read))

(defun get-weight ()
  "Ask the user to enter a weight and return its value."
  (format t "Enter your weight: ")
  (read))

(defun get-seconds ()
  "Ask the user to enter seconds and return its value."
  (format t "Enter the seconds you want to convert: ")
  (read))

(defun get-minutes ()
  "Ask the user to enter minutes and return its value."
  (format t "Enter the minutes you want to convert: ")
  (read))

(defun get-hours ()
  "Ask the user to enter hours and return its value."
  (format t "Enter the hours you want to convert: ")
  (read))

(defun get-money ()
  "Ask the user to enter money and return its value."
  (format t "Enter the money you want to convert: ")
  (read))

(defun get-date (&optional monthp yearp)
  "Ask the user to enter a date and return its value.
By default it will only get a day.
If MONTHP is non-nil it will ask for month too.
If YEARP is non-nil it will ask for year too."
  (format t "Enter a day: ")
  (let ((date (read)))
    (when monthp
      (format t "Enter a month: ")
      (setq date `(,date ,(read))))
    (when yearp
      (format t "Enter a year: ")
      (setq date `(,(car date) ,(nth 1 date) ,(read))))
    date))

(defun get-dni ()
  "Ask the user to enter his dni and return its value."
  (format t "Enter your DNI: ")
  (read))
