(uiop:define-package :lisp-practice/selection-structures/ex2
  (:documentation
   "Program that asks the user for hours, minutes and seconds and shows them
normalized.
Example: 2h80m100s => 3h21m40s")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:int-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-integer)
  (:export main))
(in-package :lisp-practice/selection-structures/ex2)

(declaim (ftype (function (integer &optional integer integer) int-list)
                normalize-time))

(defun main ()
  "Main function of the program."
  (let ((hours (get-integer "Enter an amount of hours: "))
        (minutes (get-integer "Enter an amount of minutes: "))
        (seconds (get-integer "Enter an amount of seconds: ")))
    (format t
            "~{~a~^:~}"
            (normalize-time seconds minutes hours))))

(defun normalize-time (seconds &optional (minutes 0) (hours 0))
  "Return (HOURS MINUTES SECONDS) in a normalized form (60s = 1m, 60m = 1h).
SECONDS is a INTEGER.
MINUTES is a INTEGER, defaults to 0.
HOURS is a INTEGER, defaults to 0.
Example: (normalize-time 100 80 2) => (3 21 40)."
  (let ((total-minutes (+ (floor seconds 60) minutes)))
    `(,(+ (floor total-minutes 60) hours)
      ,(mod total-minutes 60)
      ,(mod seconds 60))))
