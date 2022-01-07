(uiop:define-package :lisp-practice/selection-structures/day-of-the-week
  (:documentation
   "Program that asks the user a number of a day of the week and shows its name.
Example: 3 = \"Wednesday\"")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:string-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/selection-structures/day-of-the-week)

(declaim (type (string-list) *days-of-the-week*))

(defconstant +days-of-the-week+
  '("Monday"
    "Tuesday"
    "Wednesday"
    "Thursday"
    "Friday"
    "Saturday"
    "Sunday")
  "DAY-OF-THE-WEEK LIST specifying the names of the days of the week.
DAY-OF-THE-WEEK is a STRING.")

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "It's ~a~&"
            (name-of-nth-day number))))

(declaim (ftype (function (integer) string) name-of-nth-day))

(defun name-of-nth-day (number)
  "Return DAY-OF-THE-WEEK from `*days-of-the-week*' corresponding to NUMBER.
DAY-OF-THE-WEEK is a STRING.
NUMBER is a INTEGER.
Note: The first DAY-OF-THE-WEEK stands by 1, not 0."
  (nth (1- number) *days-of-the-week*))
