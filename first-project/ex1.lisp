;;;; Make a program that asks the user his age and shows if it is a legal age

(uiop:define-package :lisp-practice/first-project/ex1
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-age)
  (:export main))
(in-package :lisp-practice/first-project/ex1)

(defun main ()
  "Main function of the progam."
  (let ((age (get-age)))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (legal-age-p age) "yes" "no"))))

(defun legal-age-p (age &key (legal-age 18))
  "Return T if the passed age is above or equal to the default legal age, or the
one passed. Otherwise, return NIL."
  (>= age legal-age))
