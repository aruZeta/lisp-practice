(uiop:define-package :lisp-practice/selection-structures/ex6
  (:documentation
   "Program that asks the user for a date (dd/mm/yy) and shows the date of the
next day.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:date)
  (:import-from :lisp-practice/utils/type-checkers
                #:dayp)
  (:import-from :lisp-practice/utils/get-input
                #:get-date)
  (:export main))
(in-package :lisp-practice/selection-structures/ex6)

(declaim (ftype (function (date) date)
                next-date))

(defun main ()
  "Main function of the program."
  (let ((actual-date (get-date "Enter a day: " nil "Month: " nil "Year: ")))
    (format t
            "The next day will be ~{~a~^/~}~&"
            (next-date actual-date))))

(defun next-date (actual-date)
  "Return a DATE specifiying the day after ACTUAL-DATE.
ACTUAL-DATE is a DATE of the form (DAY MONTH YEAR)."
  (let ((next-date-d `(,(1+ (car actual-date))
                       ,(nth 1 actual-date)
                       ,(nth 2 actual-date)))
        (next-date-m `(1
                       ,(1+ (nth 1 actual-date))
                       ,(nth 2 actual-date)))
        (next-date-y `(1
                       1
                       ,(1+ (nth 2 actual-date)))))
    (cond
      ((apply #'dayp next-date-d) next-date-d)
      ((apply #'dayp next-date-m) next-date-m)
      ((apply #'dayp next-date-y) next-date-y))))
