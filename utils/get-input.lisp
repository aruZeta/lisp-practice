;;;; Get input from user functions used by the programs

(uiop:define-package :lisp-practice/utils/get-input
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive
                #:date
                #:day)
  (:export get-liters
           get-number
           get-character
           get-marital-status-alias
           get-age
           get-year
           get-weight
           get-seconds
           get-money
           get-date))
(in-package :lisp-practice/utils/get-input)

(declaim (ftype (function () positive) get-liters))

(defun get-liters ()
  "Ask the user to enter LITERS and return its value.
LITERS is a POSITIVE specifying an amount of liters."
  (format t "Enter how much liters you've used this month: ")
  (read))

(declaim (ftype (function () integer) get-number))

(defun get-number ()
  "Ask the user to enter INTEGER and return its value."
  (format t "Enter a number: ")
  (read))

(declaim (ftype (function () character) get-character))

(defun get-character ()
  "Ask the user to enter CHARACTER and return its value."
  (format t "Enter a character: ")
  (read-char))

(declaim (ftype (function () character) get-marital-status-alias))

(defun get-marital-status-alias ()
  "Ask the user to enter ALIAS and return its value.
ALIAS is a CHARACTER representing an alias of MARITAL STATUS in
`*alias-to-marital-status-alist*'."
  (format t "Enter the character representing your marital status (alias): ")
  (read-char))

(declaim (ftype (function () integer) get-age))

(defun get-age ()
  "Ask for the age of the user and return its value."
  (format t "Enter your age: ")
  (read))

(declaim (ftype (function () integer) get-year))

(defun get-year ()
  "Ask the user to enter a year and return its value."
  (format t "Enter a year: ")
  (read))

(declaim (ftype (function () (or float integer)) get-weight))

(defun get-weight ()
  "Ask the user to enter a weight and return its value."
  (format t "Enter your weight: ")
  (read))

(declaim (ftype (function () integer) get-seconds))

(defun get-seconds ()
  "Ask the user to enter seconds and return its value."
  (format t "Enter the seconds you want to convert: ")
  (read))

(declaim (ftype (function () integer) get-money))

(defun get-money ()
  "Ask the user to enter money and return its value."
  (format t "Enter the money you want to convert: ")
  (read))

(declaim (ftype (function (&optional boolean boolean) (or date day)) get-date))

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
