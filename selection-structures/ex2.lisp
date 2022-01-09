(uiop:define-package :lisp-practice/selection-structures/ex2
  (:documentation
   "Program that asks the user for hours, minutes and seconds and shows them
normalized.
Example: 2h80m100s => 3h21m40s")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex2)

(declaim (ftype (function (positive &optional positive positive) positive-list)
                normalize-time))

(defun main ()
  "Main function of the program."
  (let ((hours (get-positive "Enter an amount of hours: "))
        (minutes (get-positive "Enter an amount of minutes: "))
        (seconds (get-positive "Enter an amount of seconds: ")))
    (format t
            "~{~a~^:~}"
            (normalize-time seconds minutes hours))))

(defun normalize-time (seconds &optional (minutes 0) (hours 0))
  "Return (HOURS MINUTES SECONDS) in a normalized form (60s = 1m, 60m = 1h).
SECONDS is a POSITIVE.
MINUTES is a POSITIVE, defaults to 0.
HOURS is a POSITIVE, defaults to 0.
Example: (normalize-time 100 80 2) => (3 21 40)."
  (let ((total-minutes (+ (floor seconds 60) minutes)))
    `(,(+ (floor total-minutes 60) hours)
      ,(mod total-minutes 60)
      ,(mod seconds 60))))
