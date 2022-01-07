;;;; Make a program that asks the user his age and shows if it is a legal age

(uiop:define-package :lisp-practice/first-project/ex1
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-age)
  (:export main))
(in-package :lisp-practice/first-project/ex1)

(defun main ()
  "Main function of the progam."
  (let ((age (get-age)))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (legal-age-p age) "yes" "no"))))

(declaim (ftype (function (integer &key (:legal-age integer)) boolean)
                legal-age-p))

(defun legal-age-p (age &key (legal-age 18))
  "Return T if AGE is above or equal to LEGAL-AGE. Otherwise, return NIL.
AGE is a INTEGER.
LEGAL-AGE is a INTEGER which defaults to 18."
  (>= age legal-age))
