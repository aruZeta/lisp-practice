(uiop:define-package :lisp-practice/first-project/ex5
  (:documentation
   "Program that asks the user for an amount of seconds, converts them to time
format hh:mm:ss and shows it.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-seconds)
  (:export main))
(in-package :lisp-practice/first-project/ex5)

(declaim (ftype (function (integer) integer)
                seconds-to-hours)
         (ftype (function (integer &optional boolean) integer)
                seconds-to-minutes
                remainder-seconds))

(defun main ()
  "Main function of the program."
  (let ((seconds (get-seconds)))
    (format t
            "~a:~a:~a~&"
            (seconds-to-hours seconds)
            (seconds-to-minutes seconds t)
            (remainder-seconds seconds))))

(defun seconds-to-hours (seconds)
  "Return the number of hours there are in SECONDS.
SECONDS is a INTEGER."
  (floor seconds 3600))

(defun seconds-to-minutes (seconds &optional remainder-from-hour-p)
  "Return the number of minutes there are in SECONDS or if
REMAINDER-FROM-HOUR-P is non-nil the remainder minutes from calculating the
hours.
SECONDS is a INTEGER."
  (if remainder-from-hour-p
      (floor (remainder-seconds seconds t) 60)
      (floor seconds 60)))

(defun remainder-seconds (seconds &optional remainder-from-hour-p)
  "Return the remainder from calculating the minutes there are in SECONDS
or if REMAINDER-FROM-HOUR-P is non-nil from calculating the hours.
SECONDS is a INTEGER."
  (if remainder-from-hour-p
      (mod seconds 3600)
      (mod (remainder-seconds seconds t) 60)))
