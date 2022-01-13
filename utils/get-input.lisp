(uiop:define-package :lisp-practice/utils/get-input
  (:documentation
   "Collection of functions to get input from the user.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive
                #:day
                #:month
                #:date
                #:grade))
(in-package :lisp-practice/utils/get-input)

(declaim (ftype (function (string &rest list) character)
                get-character)
         (ftype (function (string &rest list) real)
                get-real)
         (ftype (function (string &rest list) integer)
                get-integer)
         (ftype (function (string &rest list) positive)
                get-positive)
         (ftype (function (string &rest list) day)
                get-day)
         (ftype (function (string &rest list) month)
                get-month)
         (ftype (function (string list string list &optional string list) date)
                get-date)
         (ftype (function (string &rest list) grade)
                get-grade))

(defun get-character (output &rest args)
  "Ask the user to enter CHARACTER and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read-char))

(defun get-real (output &rest args)
  "Ask the user to enter REAL and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))

(defun get-integer (output &rest args)
  "Ask the user to enter INTEGER and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))

(defun get-positive (output &rest args)
  "Ask the user to enter POSITIVE and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))

(defun get-day (output &rest args)
  "Ask the user to enter DAY and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))

(defun get-month (output &rest args)
  "Ask the user to enter MONTH and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))

(defun get-date (day-output day-args
                 month-output month-args
                 &optional year-output year-args)
  "Ask the user to enter DATE and return its value.
*-OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
*-ARGS is a list of arguments to apply to the formatting of OUTPUT.
By default it will only get DAY and MONTH, optionally YEAR.
If you want to get YEAR pass a 5th argument, `year-output' and optionally
`year-args'.
If you dont want to pass arguments to a specific output, pass NIL.
DATE is a LIST like '(DAY MONTH YEAR), YEAR may not appear.

Example usage:
(get-date \"Enter a day: \" nil \"Enter a month: \" nil).
(get-date \"Day: \" nil \"Month: \" nil \"Year: \").
(get-date \"Day of ~a's birthday: \" '(person) \"Month: \" nil)."
  (let ((day (apply #'get-day day-output day-args))
        (month (apply #'get-month month-output month-args)))
    (if year-output
        `(,day ,month ,(apply #'get-integer year-output year-args))
        `(,day ,month))))

(defun get-grade (output &rest args)
  "Ask the user to enter GRADE and return its value.
OUTPUT is a STRING to show (via `format'), use it to ask the user for input.
ARGS is a list of arguments to apply to the formatting of OUTPUT."
  (apply #'format t output args)
  (read))
